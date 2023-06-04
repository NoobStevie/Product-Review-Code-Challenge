class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :description
      t.integer :price
      t.integer :user_id
    end
  end
end