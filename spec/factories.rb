FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "stardude#{440 + n}" }
    sequence(:email) { |n| "stardude#{440 + n}@example.com" }
    password "password"
  end

  factory :snippet do
    name "Lazuli"
    artist "Beach House"
    notes "A, D, C, G"
  end
end
