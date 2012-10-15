namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Wei Zhou",
                 email: "weiz1@andrew.cmu.edu",
                 address: "USA",
                 password: "zoebbmm",
                 password_confirmation: "zoebbmm")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "weiz1-#{n+1}@andrew.cmu.edu"
      address  = Faker::Address.street_name
      password  = "password"
      User.create!(name: name,
                   email: email,
                   address: address,
                   password: password,
                   password_confirmation: password)
    end
  end
end