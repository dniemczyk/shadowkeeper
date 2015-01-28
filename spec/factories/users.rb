FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person A#{n}"}
    sequence(:email) { |n| "email_#{n}@example.com" }
    password "secretfoo"
    password_confirmation "secretfoo"

    # A user with administrative rights
    factory :admin do
      admin true
    end
  end
end
