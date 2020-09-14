class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content_1
      t.string :content_2
      t.string :content_3
      t.string :img
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
