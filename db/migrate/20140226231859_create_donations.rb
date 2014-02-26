class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.belongs_to :charity, index: true
      t.float :amount
      t.string :name

      t.timestamps
    end
  end
end
