FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email } # Tell factory to reevaluate this every time you call the factory
    password 'swordfish'
  end

  factory :submission do
    user # This indicates the association with user, tells it to create user if we don't assign one to a contact
    title 'Article'
    link 'examplelink.com'
    description 'Here is an article you should check out'
  end
end
