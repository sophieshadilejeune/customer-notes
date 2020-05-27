class AddFolderToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :folder, index: true
  end
end
