FactoryGirl.define do
  factory :user do
    name     "Damian Niemczyk"
    email    "dn@example.com"
    password "secretfoo"
    password_confirmation "secretfoo"
  end
end
