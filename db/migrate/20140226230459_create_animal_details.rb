class CreateAnimalDetails < ActiveRecord::Migration
  def change
    create_table :animal_details do |t|
      t.belongs_to :post, index: true
      t.string :name
      t.string :species
      t.string :color
      t.string :phone_no
      t.string :owner
      t.string :last_seen

      t.timestamps
    end
  end
end
