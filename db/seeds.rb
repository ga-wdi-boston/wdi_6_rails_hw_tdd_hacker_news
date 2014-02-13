# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
mike = User.create(email: 'mikestone@example.com', password: 'password')

10.times do |i|
	"user#{i}" = User.create(email: "user#{i}@example.com", password: 'password')
end

10.times do |i|
	user = User.find(1)
	post.create(description: "article#{i}", link: 'http://www.google.com', user_id: user.id)
end

post = Post.first
100.times do |i|
	user = User.find(3)
	post.comments(body: "Comment number #{i}", user_id: user.id )
