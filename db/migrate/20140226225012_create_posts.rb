class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :charity, index: true
      t.belongs_to :user, index: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
