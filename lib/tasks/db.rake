namespace :db do
  desc "Remaking data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke

    puts "Creating admin"
    FactoryGirl.create :user, admin: true, email: "admin@fts.com"

    puts "Creating user"
    5.times {FactoryGirl.create :user}
  end
end
