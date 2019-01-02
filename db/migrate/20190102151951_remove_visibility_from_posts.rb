class RemoveVisibilityFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :visibility, :boolean
  end
end
