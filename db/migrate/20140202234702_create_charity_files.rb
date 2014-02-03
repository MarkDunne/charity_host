class CreateCharityFiles < ActiveRecord::Migration
  def change
    create_table :charity_files do |t|
      t.integer :charity_id
      t.string :file

      t.timestamps
    end
  end
end
