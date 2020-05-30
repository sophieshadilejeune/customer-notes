class CreateCustomerProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_products do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
