class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :text
      t.integer :category_id
      t.integer :price
      t.integer :condition_id
      t.integer :shipping_id
      t.integer :prefecture_id
      t.integer :day_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
