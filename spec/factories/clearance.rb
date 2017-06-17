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
    user
  end

  factory :audio_file do
    artist "Beach House"
    title "Lazuli"
    audio { File.new("#{Rails.root}/spec/support/fixtures/test.mp3") }
    user
  end

  factory :wishlist do
    artist "Beach House"
    title "Lazuli"
    instrument "piano"
    user
  end

  factory :activity do
    snippet_type
    user

    trait :snippet_type do
      before(:create) do |activity|
        activity.subject = create(:snippet, user: activity.user)
      end
    end

    trait :audio_file_type do
      before(:create) do |activity|
        activity.subject = create(:audio_file, user: activity.user)
      end
    end

    trait :wishlist_type do
      before(:create) do |activity|
        activity.subject = create(:wishlist, user: activity.user)
      end
    end
  end
end
