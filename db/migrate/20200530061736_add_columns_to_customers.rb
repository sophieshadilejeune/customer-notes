class AddColumnsToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :contact_name, :string
    add_column :customers, :website, :string
    add_column :customers, :company_name, :string
    add_column :customers, :email, :string
    remove_column :customers, :name, :string
  end
end
