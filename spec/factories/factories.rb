FactoryGirl.define do

  factory :article do
    title { Faker::Lorem.word }
    url { Faker::Internet.url }
  end
end
