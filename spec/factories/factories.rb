FactoryGirl.define do

	factory :user do
		email { Faker::Internet.email }
		password 'swordfish'
	end

	factory :google, class: Post do
		title 'Google'
		link 'http://google.com'
		description 'I can haz search?'
		user
	end

	factory :twitter, class: Post do
		title 'Twitter'
		link 'http://twitter.com'
		description '140 characters'
		user
	end

	factory :kiva, class: Post do
		title 'Kiva'
		link 'http://kiva.org'
		description 'Microfinance loans to the developing world'
		user
	end

end
