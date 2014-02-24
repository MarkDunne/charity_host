class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :domain
      t.string :email
      t.string :passcode
      t.timestamps
    end
  end
end
