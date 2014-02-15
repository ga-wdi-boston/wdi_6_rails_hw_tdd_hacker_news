# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Post.create(title: 'How the US Treasury imposes sanctions on me and every other "Stephen Law" on the planet - my letter to OFAC', body: 'This person is Burmese and is suspected by US Treasury of drug trafficking. He is the son of Lo Hsing Han (dubbed by US Treasury as "The Godfather of Heroin") and has a Singaporean wife. His addresses, as listed by you, are all in Burma and Singapore. None are in the UK.
')

p2 = Post.create(title: 'Losing graciously', body: 'With Bdale Garbee’s casting vote this week, the Debian technical committee finally settled the question of init for both Debian and Ubuntu in favour of systemd..
')

p3 = Post.create(title: 'Cryptic Crossword: Amateur Crypto and Reverse Engineering', body: "Reverse engineering is a special subgenre of computer programming. It's about the closest that I as a programmer get to being a scientist. Gather data, formulate a hypothesis, test, refine, repeat: reverse engineering is basically applying the scientific method to a very, very small knowledge domain. If you've never tried to reverse-engineer a program before, you may be wondering how one goes about such a task. The following essay retraces one of the more colorful reverse-engineering problems that I've pursued.")

p4 = Post.create(title: 'Crazy ants take on fire ants and win', body: 'If you’ve ever been attacked by red imported fire ants, you can likely attest that these tiny insects have a nasty defense mechanism. When threatened, fire ants inject or dab their enemy with a potent neurotoxic venom that quickly dispatches most other ants and can sometimes even send humans to the hospital.')

c1 = Comment.create(body: 'Nice!')

c2 = Comment.create(body: 'This is useful!')

c3 = Comment.create(body: 'Pretty decent!')

p1.comments << c1 << c2

p2.comments << c2 << c3

p3.comments << c3 << c1

