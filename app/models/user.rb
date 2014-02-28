class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :admins_charities
  has_many :managed_charities, source: :charity, through: :admins_charities
  # has_many :charities, through: :admins_charities

  has_many :posts
  has_many :comments
  has_many :newsletter_subscriptions

  def admin_of (charity)
    managed_charities.exists?(charity)
  end
end
