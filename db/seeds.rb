# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def rand_int(from, to)
  rand_in_range(from, to).to_i
end

def rand_price(from, to)
  rand_in_range(from, to).round(2)
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
  rand * (to - from) + from
end

user = User.new
user.email = "mark@gmail.com"
user.password = "password"
user.password_confirmation = "password"
user.superadmin = true
user.save!
charity = Charity.create(name: "Marks Charity", domain: "lvh.me")
AdminsCharity.create(user_id: 1, charity_id: 1)
post = Post.create(charity_id: 1, user_id: 1, title:"some title", content:"some content")
post.tags.create(tag: "tag1")
post.tags.create(tag: "tag2")

for i in 0..300
   charity.views.create(created_at: rand_time(100.days.ago))
end