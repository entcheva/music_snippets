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

  factory :snippet do
    artist "Beach House"
    title "Lazuli"
    notes "A, B, D, F"
  end
end
