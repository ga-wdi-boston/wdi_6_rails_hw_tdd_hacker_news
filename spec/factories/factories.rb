FactoryGirl.define do
  factory :user do
    email 'becky@email.com'
    password 'password'
  end

  factory :submission do
  	user
    title 'A Wonderful Story'
    url  'http://publishing.cdlib.org/ucpressebooks/view?docId=ft5q2nb3z7&brand=ucpress'
  end
end
