class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :publisher, :boolean
    add_column :users, :correspondent, :boolean
  end
end
