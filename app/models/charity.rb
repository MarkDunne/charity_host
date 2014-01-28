class Charity < ActiveRecord::Base
	validates_uniqueness_of :name
	validates_uniqueness_of :domain
	validates_presence_of :name
	validates_presence_of :domain

	has_and_belongs_to_many :users
end
