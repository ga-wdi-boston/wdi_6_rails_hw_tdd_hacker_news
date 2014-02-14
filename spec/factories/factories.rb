FactoryGirl.define do

	factory :user, class: User do
		email { Faker::Internet.email }
		password 'swordfish'
	end

	factory :post, class: Post do
		title { Faker::Lorem.word }
		link { Faker::Internet.url }
		description { Faker::Lorem.word }
		user
	end

	factory :comment, class: Comment do
		body { Faker::Lorem.words.join }
		post
		user
	end

end
