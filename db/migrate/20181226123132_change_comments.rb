class ChangeComments < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :commenter, :string, null: false
    change_column :comments, :body, :string, null: false
  end
end
