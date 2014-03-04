class AdminsCharity < ActiveRecord::Base
  belongs_to :user
  belongs_to :charity

  after_save :update_charity_passcode
  before_destroy :update_charity_passcode

  private

  def update_charity_passcode
  	self.charity.generate_passcode
  	self.charity.save
  end
end
