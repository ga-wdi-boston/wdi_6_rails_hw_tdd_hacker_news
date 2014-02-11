FactoryGirl.define do
	factory :user do
		email { Faker::Internet.email }
		password 'password'
	end

	factory :article do
		user
		title { Faker::Name.first_name }
		blurb { Faker::Name.last_name }
		content 'la la la la'
	end

	factory :comment do
		user
		article
		content 'la la la la de dah de dah'
	end

end
