# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_1 = User.create(email: 'firstemail@gmail.com', password: 'password1', password_confirmation: 'password1')
user_2 = User.create(email: 'secondemail@gmail.com', password: 'password2', password_confirmation: 'password2')
user_3 = User.create(email: 'thirdemail@gmail.com', password: 'password3', password_confirmation: 'password3')
user_4 = User.create(email: 'fourthemail@gmail.com', password: 'password4', password_confirmation: 'password4')
user_5 = User.create(email: 'fifthemail@gmail.com', password: 'password5', password_confirmation: 'password5')
