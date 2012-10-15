

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@andrew.cmu.edu"}
    sequence(:address) { |n| "Person #{n}" }
    password "zoebbmm"
    password_confirmation "zoebbmm"

    factory :admin do
      admin true
    end
  end
end