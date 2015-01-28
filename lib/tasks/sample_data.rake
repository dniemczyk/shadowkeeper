# For development populate the db with sample data
# use:
# rake db:reset
# rake db:populate
# rake test:prepare

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    User.create!(name:  "Example User",
                 email: "example@example.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = "foobar_#{n}"

      User.create!(name:  name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
