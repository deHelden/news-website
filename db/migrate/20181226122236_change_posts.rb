class ChangePosts < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.remove :name
    end

    change_column :posts, :title, :string, null: false
    change_column :posts, :content, :string, null: false
    change_column :posts, :description, :string, null: false
    change_column :posts, :status, :string, null: false
  end
end
