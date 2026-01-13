namespace :screenshots do
  desc "Capture screenshots for app pages"
  task capture: :environment do
    puts `bin/rails runner script/capture_screenshots.rb`
  end
end
