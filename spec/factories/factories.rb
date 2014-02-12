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

end
