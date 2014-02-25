class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :charities, through: :admins_charities
  has_many :posts
  has_many :comments
  has_many :newsletter_subscriptions


  after_create :accept_admin_offers

  private

  def accept_admin_offers
  	CharityInviteOffers.where(email: self.email).each do |offer|
  		if !offer.accepted
  			CharitiesUsers.create(user_id: self.id, charity_id: offer.charity_id)
  			offer.accepted = true
  			offer.save
  		end
  	end
  end
end
