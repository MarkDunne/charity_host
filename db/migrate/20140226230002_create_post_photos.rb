class CreatePostPhotos < ActiveRecord::Migration
  def change
    create_table :post_photos do |t|
      t.belongs_to :post, index: true
      t.string :photo

      t.timestamps
    end
  end
end
