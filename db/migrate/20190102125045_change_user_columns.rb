class ChangeUserColumns < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |u|
      u.change :publisher, :boolean, default: false
      u.change :correspondent, :boolean, default: false
    end
  end
end
