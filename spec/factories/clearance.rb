FactoryGirl.define do
  sequence :email do |n|
    "stardude44#{n}@example.com"
  end

  sequence :username do |n|
    "stardude44#{n}"
  end

  factory :user do
    email
    username
    password "password"
  end
end
