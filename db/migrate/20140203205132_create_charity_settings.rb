class CreateCharitySettings < ActiveRecord::Migration
  def change
    create_table :charity_settings do |t|
      t.belongs_to :charity
      t.string :base_style, default: "style1.css"
      t.string :text_color
      t.string :header_image
      t.boolean :enable_paypal_donations
      t.string :paypal_email
      t.text :about, default: "Update 'About Your Charity' in the admin view"
      t.timestamps
    end
  end
end
