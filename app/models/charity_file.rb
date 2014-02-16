require 'carrierwave/orm/activerecord'

class CharityFile < ActiveRecord::Base
	belongs_to :charity
	mount_uploader :file, CharityFileUploader
end
