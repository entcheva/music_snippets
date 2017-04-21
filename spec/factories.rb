FactoryGirl.define do
  factory :user do
    username "stardude440"
    email "stardude440@gmail.com"
    password_digest "password"
  end

  factory :snippet do
    name "Lazuli"
    artist "Beach House"
    notes:"A, D, C, G"
  end
end
