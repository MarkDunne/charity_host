class Post < ActiveRecord::Base
  belongs_to :charity
  belongs_to :user

  has_many :comments
  has_many :post_tags
  has_many :post_photos
  has_one :animal_detail
end
