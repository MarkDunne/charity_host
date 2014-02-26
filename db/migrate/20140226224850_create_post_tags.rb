class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.belongs_to :post, index: true
      t.string :tag

      t.timestamps
    end
  end
end
