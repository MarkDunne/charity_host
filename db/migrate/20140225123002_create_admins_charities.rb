class CreateAdminsCharities < ActiveRecord::Migration
  def change
    create_table :admins_charities do |t|
      t.belongs_to :user, index: true
      t.belongs_to :charity, index: true

      t.timestamps
    end
  end
end
