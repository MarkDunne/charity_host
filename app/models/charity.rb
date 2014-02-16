class Charity < ActiveRecord::Base
	validates_uniqueness_of :name
	validates_uniqueness_of :domain
	validates_presence_of :name
	validates_presence_of :domain

	has_and_belongs_to_many :users
	has_many :posts
	has_many :messages
	has_many :uploads, class_name: "CharityFile"
	has_one :settings, class_name: "CharitySettings"
	has_many :admin_offers, class_name: "CharityInviteOffers"

	before_create :build_settings
end
