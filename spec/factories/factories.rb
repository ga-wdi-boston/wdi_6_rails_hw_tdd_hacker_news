FactoryGirl.define do

  factory :comment do
    body { Faker::Lorem.word }
    article
  end

  factory :article do
    title { Faker::Lorem.word }
    url 'http://www.example.com'
    user
  end

  factory :user do
    email { Faker::Internet.email }
    password 'notrealpassword'
  end

end
