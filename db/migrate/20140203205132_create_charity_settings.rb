class CreateCharitySettings < ActiveRecord::Migration
  def change
    create_table :charity_settings do |t|
      t.belongs_to :charity
      t.string :base_template, default: "charity/default"
      t.string :text_color
      t.boolean :enable_paypal_donations
      t.string :paypal_email
      t.timestamps
    end
  end
end
