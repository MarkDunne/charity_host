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

  private

  def generate_passcode
    #TODO generate passcode
    begin
      range = [*'0'..'9', *'A'..'Z']
      self.passcode = Array.new(8){range.sample}.join
    end while Charity.find_by_passcode(self.passcode)    
  end
end
