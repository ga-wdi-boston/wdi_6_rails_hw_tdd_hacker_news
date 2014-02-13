# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create( email: "bob@gmail.com", password: "foobar123")
u2 = User.create( email: "carol@gmail.com", password: "foobar123")

a1 = Post.create(body: "What America is all about", link: "http://www.nytimes.com/2014/02/12/opinion/what-is-america-all-about.html")
a2 = Post.create(body: "New Jersey slaps MIT Bitcoin hackers with subpoena — and they’re fighting back", link: "http://venturebeat.com/2014/02/12/new-jersey-slaps-mit-bitcoin-hackers-with-subpoena-and-theyre-fighting-back/")
a3 = Post.create(body: "Saying goodbye to python", link: "http://www.ianbicking.org/blog/2014/02/saying-goodbye-to-python.html")

u1.posts << a1 << a2
u2.posts << a3

c1 = Comment.create(body: "Awesome")
c2 = Comment.create(body: "First post")
c3 = Comment.create(body: "Sweet!")

a1.comments << c1 << c2 << c3


# rake db:seed