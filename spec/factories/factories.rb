FactoryGirl.define do
	factory :user do
		email { Faker::Internet.email }
		password 'password'
	end

	factory :article do
		user
		title { Faker::Name.title }
		blurb 'la la la la la'
		url 'https://www.google.com/'
	end

	factory :comment do
		user
		article
		content 'la la la la de dah de dah'
	end


  factory :up_vote, class: Vote do
  	user
    direction true
  end

  factory :down_vote, class: Vote do
  	user
    direction false
  end

  factory :article_vote, class: Vote do
    association :votable, factory: :article
    direction true
    association :user
  end

  factory :comment_vote, class: Vote do
    association :votable, factory: :comment
    direction false
    association :user
  end

end
