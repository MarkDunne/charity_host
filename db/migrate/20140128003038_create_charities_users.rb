class CreateCharitiesUsers < ActiveRecord::Migration
  def change
    create_table :charities_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :charity, index: true

      t.timestamps
    end
  end
end
