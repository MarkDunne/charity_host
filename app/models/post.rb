class Post < ActiveRecord::Base
  belongs_to :charity
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  has_many :comments
  has_many :tags, class_name: "PostTag"
  has_many :photos, class_name: "PostPhoto"
  has_one :animal_detail

  def has_tag (tag)
  	post_tags.exists?(tag: tag)
  end
end
