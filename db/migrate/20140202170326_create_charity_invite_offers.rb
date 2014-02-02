class CreateCharityInviteOffers < ActiveRecord::Migration
  def change
    create_table :charity_invite_offers do |t|
      t.string :email
      t.integer :charity_id
      t.datetime :expires
      t.boolean :accepted, default: false
      t.timestamps
    end
  end
end
