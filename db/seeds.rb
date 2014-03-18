# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.email = "mark@gmail.com"
user.password = "password"
user.password_confirmation = "password"
user.superadmin = true
user.save!
Charity.create(name: "Marks Charity", domain: "lvh.me")
AdminsCharity.create(user_id: 1, charity_id: 1)
post = Post.create(charity_id: 1, user_id: 1, title:"some title", content:"some content")
post.tags.create(tag: "tag1")
post.tags.create(tag: "tag2")