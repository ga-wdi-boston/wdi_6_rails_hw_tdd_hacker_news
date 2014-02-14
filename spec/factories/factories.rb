FactoryGirl.define do

  factory :article do
    title { Faker::Lorem.word }
    url 'http://validurl.com'
    text { Faker::Lorem.words.join }
    user
  end

  factory :user do
    email { Faker::Internet.email }
    password 'password'
  end

  factory :comment do
    content { Faker::Lorem.words.join }
    article
  end

  # Vote factories

  factory :article_vote, class: Vote do
    association :votable, factory: :article
    direction false
    association :user
  end

  factory :comment_vote, class: Vote do
    association :votable, factory: :comment
    direction false
    association :user
  end
end
