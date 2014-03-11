class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :domain
      t.string :email
      t.string :passcode
      t.boolean :verified, default: false
      t.timestamps
    end
  end
end
