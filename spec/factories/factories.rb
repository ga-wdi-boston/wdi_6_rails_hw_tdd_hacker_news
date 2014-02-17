FactoryGirl.define do
	factory :user do
		email 'bob@example.com'
		password 'password'
	end

	factory :post do
		description 'A new post'
		link 'http://www.google.com'
		id 1
		user
	end

	factory :comment do
		body 'This is a test comment body'
		user
		post
	end
end
