class CreateAnimalDetails < ActiveRecord::Migration
  def change
    create_table :animal_details do |t|
      t.belongs_to :post, index: true
      t.string :name
      t.string :email
      t.string :animal_name
      t.text :details
    end
  end
end
