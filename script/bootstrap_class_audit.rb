#!/usr/bin/env ruby
require 'csv'

ROOT = File.expand_path('../', __dir__)
VIEWS = Dir.glob(File.join(ROOT, 'app', 'views', '**', '*.{erb,html.erb,haml,slim}'))
PATTERNS = [
  /^btn/, /^row\b/, /^col-/, /^card\b/, /^card-/, /^badge\b/, /^alert\b/, /^navbar\b/,
  /^form-control\b/, /^form-label\b/, /^list-group\b/, /^table\b/, /^btn-group\b/, /^dropdown\b/, /^dropdown-menu\b/,
  /^btn-outline/, /^btn-sm/, /^btn-lg/, /^gx-/, /^gy-/, /^g-/, /^d-/, /^justify-content/, /^align-items/, /^float-/,
  /^me-/, /^ms-/, /^ml-/, /^mr-/, /^mt-/, /^mb-/, /^mx-/, /^my-/, /^p-/, /^pt-/, /^pb-/, /^pl-/, /^pr-/, /^px-/, /^py-/,
  /^bg-(success|light|transparent|white|danger|info|warning|secondary)/, /^text-(white|muted|dark|success|primary|center|left|right)/,
  /^fw-/, /^rounded/, /^shadow/, /^list-group/, /^fa-/, /^fas\b/, /^bi\b/, /^btn-link/
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
