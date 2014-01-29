class CreateCharityTemplates < ActiveRecord::Migration
  def change
    create_table :charity_templates do |t|
      t.string :base_template, default: "charity/default"
      t.string :text_color
      t.belongs_to :charity
      t.timestamps
    end
  end
end
