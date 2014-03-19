class CreateCharityViews < ActiveRecord::Migration
  def change
    create_table :charity_views do |t|
      t.string :ip
      t.belongs_to :charity, index: true

      t.timestamps
    end
  end
end
