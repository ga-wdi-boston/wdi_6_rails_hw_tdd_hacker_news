# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
mike = User.create(email: 'mikestone@example.com', password: 'password')

10.times do |i|
	User.create(email: "users#{i}@example.com", password: 'password')
end

200.times do |i|
	user = User.first
	Post.create(description: "articles#{i}", link: 'http://www.google.com', user_id: user.id)
end


200.times do |i|
	post = Post.first
	user = User.last
	post.comments.create(body: "Comment number #{i}", user_id: user.id )
end
