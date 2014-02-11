FactoryGirl.define do

 factory :article do
 	user
 	title 'Test article'
 	url 'www.article.com'
 	points 0
 end

 factory :user do
 	email { Faker::Internet.email }
 	password 'password'
 end

end



