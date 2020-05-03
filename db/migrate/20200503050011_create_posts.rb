class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :genre_id
      t.integer :tag_id
      t.string :title
      t.text :text
      t.string :image_id

      t.timestamps
    end
  end
end
