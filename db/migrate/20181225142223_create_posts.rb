class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :content
      t.text :description
      t.text :visibility
      t.datetime :published_date
      t.text :status
      t.boolean :importance
      t.float :rating

      t.timestamps
    end
  end
end
