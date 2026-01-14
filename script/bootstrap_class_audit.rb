#!/usr/bin/env ruby
require 'csv'

ROOT = File.expand_path('../', __dir__)
VIEWS = Dir.glob(File.join(ROOT, 'app', 'views', '**', '*.{erb,html.erb,haml,slim}'))
PATTERNS = [
  # Bootstrap-specific components and patterns only (avoid generic utility matches to not flag Tailwind)
  /^btn-/, /^btn$/, /^btn-group\b/, /^btn-outline/, /^btn-sm/, /^btn-lg/,
  /^card\b/, /^card-/, /^badge\b/, /^alert\b/, /^navbar\b/,
  /^form-control\b/, /^form-select\b/, /^form-label\b/, /^input-group\b/, /^form-check\b/,
  /^list-group\b/, /^table$/, /^table-(hover|sm|light|responsive)/, /^dropdown\b/, /^dropdown-menu\b/,
  /^row\b/, /^col-\w+/, /^gx-/, /^gy-/, /^g-/, /^justify-content/, /^align-items/,
  /^fw-/, /^me-/, /^ms-/, /^btn-link/
]

results = []
VIEWS.each do |file|
  next unless File.file?(file)
  content = File.read(file)
  classes = content.scan(/class\s*=\s*"([^"]+)"/m).flatten
  next if classes.empty?
  tokens = classes.flat_map { |c| c.split(/\s+/) }
  tokens = tokens.map { |t| t.gsub(/\A\.+|\.+\Z/, '') } # trim dots
  bs = tokens.select { |t| PATTERNS.any? { |p| p.match?(t) } }
  bs.uniq!
  unless bs.empty?
    results << [ file.sub(ROOT + '/', ''), bs.sort.join(' ') ]
  end
end

Dir.mkdir(File.join(ROOT, 'doc')) unless Dir.exist?(File.join(ROOT, 'doc'))
CSV.open(File.join(ROOT, 'doc', 'bootstrap_class_audit.csv'), 'wb') do |csv|
  csv << [ 'file', 'bootstrap_classes' ]
  results.sort.each do |row|
    csv << row
  end
end
puts "Wrote doc/bootstrap_class_audit.csv (#{results.size} files)"
