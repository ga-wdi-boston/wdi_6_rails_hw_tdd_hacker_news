FactoryGirl.define do
	factory :user do
		email { Faker::Internet.email }
		password 'swordfish'
	end

	factory :article do
		description { Faker::Lorem.words.join }
		link { Faker::Internet.url }
	end

	factory :comment do
		body { Faker::Lorem.sentence }
	end

	factory :up_vote, class: Vote do
		vote true
	end

	factory :down_vote, class: Vote do
		vote false
	end
end
