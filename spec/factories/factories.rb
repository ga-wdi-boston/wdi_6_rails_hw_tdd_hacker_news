FactoryGirl.define do

  factory :article do
    title { Faker::Lorem.word }
    url { Faker::Internet.url }
    text { Faker::Lorem.words.join }
    user
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
