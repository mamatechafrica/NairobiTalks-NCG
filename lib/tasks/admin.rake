namespace :admin do
  desc "Create an admin user"
  task :create_admin, [:email, :password] => :environment do |t, args|
    if args[:email].blank? || args[:password].blank?
      puts "Usage: rails admin:create_admin[email@example.com,password123]"
      exit 1
    end

    user = User.find_or_initialize_by(email: args[:email])
    user.password = args[:password]
    user.password_confirmation = args[:password]
    user.admin = true

    if user.save
      puts "Admin user created successfully: #{user.email}"
    else
      puts "Failed to create admin user: #{user.errors.full_messages.join(', ')}"
    end
  end
end