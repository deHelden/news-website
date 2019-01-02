class ChangePostColumns < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |p|
      p.change :visibility, 'boolean USING CAST(visibility AS boolean)', default: false
    end
  end
end
