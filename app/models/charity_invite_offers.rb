class CharityInviteOffers < ActiveRecord::Base
	validates_presence_of :email
	validates_uniqueness_of :email, :scope => :charity_id
	belongs_to :charity
end
