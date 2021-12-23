class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :product_explain, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :fee_load_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :send_by_id, null: false
      t.integer :price, null: false
      t.references :user, null:false, foreign: true

      t.timestamps
    end
  end
end
