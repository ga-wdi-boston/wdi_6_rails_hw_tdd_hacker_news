FactoryGirl.define do

  factory :article do
    title { Faker::Lorem.word }
    url { Faker::Internet.url }
  end

  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
