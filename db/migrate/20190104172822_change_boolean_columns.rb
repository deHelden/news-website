class ChangeBooleanColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :admin, :boolean, default: false, null: false
    change_column :users, :publisher, :boolean, default: false, null: false
    change_column :users, :correspondent, :boolean, default: false, null: false
    change_column :posts, :importance, :boolean, default: false, null: false
  end
end
