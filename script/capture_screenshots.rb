# Usage: bin/rails runner script/capture_screenshots.rb
# Captures screenshots for public (mobile) and admin (desktop) pages.
require 'capybara/rails'
require 'selenium-webdriver'
require 'fileutils'
require 'json'

puts "Starting screenshot capture..."

# Register headless chrome drivers for desktop and mobile
Capybara.register_driver :chrome_desktop do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=1366,768')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :chrome_mobile do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless')
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--window-size=375,812')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.server = :puma
Capybara.default_max_wait_time = 5

session_mobile = Capybara::Session.new(:chrome_mobile)
session_desktop = Capybara::Session.new(:chrome_desktop)

# Prepare output dirs
BASE_DIR = Rails.root.join('doc', 'screenshots')
MOBILE_DIR = BASE_DIR.join('mobile')
DESKTOP_DIR = BASE_DIR.join('desktop')
FileUtils.mkdir_p(MOBILE_DIR)
FileUtils.mkdir_p(DESKTOP_DIR)

manifest = []

# Ensure we have a sample record for dynamic routes
def ensure_sample_community_idea
  CommunityIdea.first || CommunityIdea.create!(title: 'Sample screenshot idea', description: 'Auto-generated sample idea for screenshots', ward: 'Central', topic: 'Transport')
rescue => e
  puts "Failed to create CommunityIdea: #{e.message}"
  nil
end

# Ensure admin user exists
admin_email = ENV['SCREENSHOT_ADMIN_EMAIL'] || 'admin@local.test'
admin_password = ENV['SCREENSHOT_ADMIN_PASSWORD'] || 'password'
admin_user = User.find_by(email: admin_email)
unless admin_user
  puts "Creating admin user #{admin_email}..."
  admin_user = User.create!(email: admin_email, password: admin_password, password_confirmation: admin_password, admin: true)
else
  if !admin_user.admin?
    admin_user.update!(admin: true)
  end
end

# Derive routes to capture
routes = Rails.application.routes.routes.map do |r|
  verb = r.verb.to_s
  path = r.path.spec.to_s
  controller = r.defaults[:controller]
  action = r.defaults[:action]
  { verb: verb, path: path, controller: controller, action: action }
end

# Filter to GET/HEAD routes and remove internal Rails and assets
candidate_paths = routes.select do |r|
  r[:verb] =~ /GET|HEAD/ &&
  !r[:path].include?('_rails') &&
  !r[:path].include?('/rails/') &&
  !r[:path].include?('active_storage') &&
  !r[:path].include?('*')
end.map { |r| r[:path].gsub('(.:format)', '') }.uniq

# Helper: build path, substituting ids where necessary
# This will replace common named segments like :community_idea_id and :id
def build_path(path)
  return path unless path.include?(':')
  built = path.dup

  # common replacements
  built.gsub!(/:community_idea_id/) { ensure_sample_community_idea&.id&.to_s }
  built.gsub!(/:id/) do
    # try to use community_idea as default when present
    if built =~ %r{community_ideas/:id}
      ensure_sample_community_idea&.id&.to_s
    else
      nil
    end
  end

  # generic named segments
  built.gsub!(/:([a-z0-9_]+)/) do |match|
    name = match[1..-1]
    case name
    when /community_idea/ then ensure_sample_community_idea&.id&.to_s
    when /planning_document/ then PlanningDocument.first&.id&.to_s rescue nil
    when /user/ then User.first&.id&.to_s rescue nil
    else
      nil
    end
  end

  # If we still have unresolved segments, skip this route
  return nil if built.include?(':')
  built
end

# Normalize path to a safe filename
def safe_filename(path)
  name = path.gsub(/[^a-z0-9]+/i, '-').gsub(/(^-|-$)/, '')
  name = 'root' if name.empty?
  name
end

# Visit helper with sizing and screenshot
def capture(session, path, file_path, width:, height:)
  puts "Visiting: #{path} (#{width}x#{height}) -> #{file_path}"
  begin
    session.current_window.resize_to(width, height)
  rescue => _e
    # ignore resize failures
  end
  session.visit(path)
  sleep 0.6 # small pause for content
  session.save_screenshot(file_path)
  true
rescue => e
  puts "Failed to capture #{path}: #{e.class} #{e.message}"
  # Fallback: save HTML snapshot so designer can still review content
  begin
    fallback = file_path.sub(/\.png$/, '.html')
    File.write(fallback, session.html)
    puts "Saved fallback HTML snapshot: #{fallback}"
  rescue => html_e
    puts "Failed to save HTML fallback: #{html_e.class} #{html_e.message}"
  end
  false
end

# Ensure server is running via Capybara server; create absolute urls
puts "Found #{candidate_paths.size} candidate paths; we'll attempt to visit and capture them."

# Additional representative static routes to ensure coverage
extra_paths = [ '/', '/community_ideas', '/submissions/new', '/planning_documents', '/users/sign_in', '/users/sign_up', '/profile' ]
paths_to_capture = (candidate_paths + extra_paths).uniq

paths_to_capture.each do |raw_path|
  path = raw_path
  built = build_path(path)
  next unless built
  final_path = built

  is_admin = final_path.start_with?('/admin')

  if is_admin
    session = session_desktop
    # ensure admin login via UI
    login_path = '/admin/login'
    begin
      session.visit(login_path)
      if session.has_field?('Email') || session.has_field?('user[email]')
        session.fill_in('Email', with: admin_email) rescue session.fill_in('user[email]', with: admin_email) rescue nil
      end
      if session.has_field?('Password') || session.has_field?('user[password]')
        session.fill_in('Password', with: admin_password) rescue session.fill_in('user[password]', with: admin_password) rescue nil
      end
      if session.has_button?('Sign in')
        session.click_button('Sign in')
      elsif session.has_button?('Log in')
        session.click_button('Log in')
      else
        session.find('form').submit rescue nil
      end
      sleep 0.8
    rescue => e
      puts "Admin login attempt failed: #{e.message}"
    end

    file_path = DESKTOP_DIR.join("#{safe_filename(final_path)}.png")
    ok = capture(session, final_path, file_path.to_s, width: 1366, height: 768)
    manifest << { path: final_path, file: file_path.to_s, viewport: 'desktop', success: ok }
  else
    session = session_mobile
    file_path = MOBILE_DIR.join("#{safe_filename(final_path)}.png")
    ok = capture(session, final_path, file_path.to_s, width: 375, height: 812)
    manifest << { path: final_path, file: file_path.to_s, viewport: 'mobile', success: ok }
  end
end

# Save manifest
manifest_path = BASE_DIR.join('manifest.json')
File.write(manifest_path, JSON.pretty_generate(manifest))
puts "Screenshots saved to #{BASE_DIR}. Manifest: #{manifest_path}"
puts "Done."
