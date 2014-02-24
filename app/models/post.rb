class Post < ActiveRecord::Base
	validates_presence_of :user_id
	validates_presence_of :charity_id

	belongs_to :charity
	belongs_to :user
  has_many :post_tags
end
