class Charity < ActiveRecord::Base
	validates_uniqueness_of :name
	validates_uniqueness_of :domain
	validates_presence_of :name
	validates_presence_of :domain

  has_many :admins_charities
  has_many :admins, source: :user, through: :admins_charities

	has_many :posts
  has_many :donations
  has_many :newsletter_subscriptions
  has_one :settings, class_name: "CharitySettings"

	before_create :build_settings
  before_create :generate_passcode

  def generate_passcode
    begin
      range = [*'0'..'9', *'A'..'Z']
      self.passcode = Array.new(8){range.sample}.join
    end while Charity.find_by_passcode(self.passcode)    
  end

  def admin_posts
    posts.order('created_at DESC').select{|p| p.author.admin_of self}
  end

  def user_posts
    posts.order('created_at DESC').select{|p| !p.author.admin_of self}
  end

  def all_tags
    admin_posts.map{|p| p.tags}.flatten
  end

  def all_tags_ordered
    hash = Hash.new(0)
    all_tags.each {|t| hash[t.tag] +=1 }
    hash.sort_by{|tag, count| count}.map{|kvPair| kvPair.first}
  end
end
