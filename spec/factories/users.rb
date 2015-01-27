FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person A#{n}"}
    sequence(:email) { |n| "email_#{n}@example.com" }
    password "secretfoo"
    password_confirmation "secretfoo"
  end
end
