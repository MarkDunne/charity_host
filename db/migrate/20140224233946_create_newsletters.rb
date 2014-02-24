class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.belongs_to :charity, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
