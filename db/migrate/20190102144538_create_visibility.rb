class CreateVisibility < ActiveRecord::Migration[5.1]
  def change
    create_table :visibilities do |t|
      t.string :name
      t.references :post, foreign_key: true
    end
  end
end
