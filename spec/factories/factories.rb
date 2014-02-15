FactoryGirl.define do

  factory :user do
    email { Faker::Internet.email }
    password 'swordfish'
  end

  factory :post do
    user
    title 'Top 10 Today'
    body 'This is an empty post'
  end

  factory :comment do
    user
    post
    body 'Pretty decent'
  end

  factory :post_vote, class: Vote do
    association :votable, factory: :post
    association :user
  end

  factory :comment_vote, class: Vote do
    association :votable, factory: :comment
    association :user
  end

end
