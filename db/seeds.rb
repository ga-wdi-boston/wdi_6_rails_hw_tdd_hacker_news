# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
  User.create!(email: Faker::Internet.email, password: 'password')
end

200.times do |i|
  article = Article.create!(title: Faker::Lorem.word, url: Faker::Lorem.word, user: User.find(1) )
  puts "Created Article #{i}"

  rand(5).times do |i|
    the_user = User.find(1)
    article.comments.create!(body: Faker::Lorem.paragraphs(i+1).join(' '), user: the_user)
    puts "Created comment for #{article.title} "
  end
end