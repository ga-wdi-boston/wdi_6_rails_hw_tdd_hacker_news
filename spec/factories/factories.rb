FactoryGirl.define do
	factory :user do
		email "songyiyang@gmail.com"
		password 'swordfish'
	end

	factory :another_user, class: User do
		email "yuyun@gmail.com"
		password 'yuyunhanismygf'
	end

	factory :post do
		user
		title "Google"
		links 'google.com'
		
	end

	# factory :contact2 do
	# 	first_name 'Yuyun'
	# 	last_name 'Han'
	# 	phone_number '333-3333'
	# end
end
