class RemoveContent2ToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :content_2, :string
    remove_column :posts, :content_3, :string
  end
end
