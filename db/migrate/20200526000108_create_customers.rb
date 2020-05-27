class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact_number
      t.string :address
      t.string :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
