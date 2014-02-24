class Newsletter < ActiveRecord::Base
  belongs_to :charity
  belongs_to :user
end
