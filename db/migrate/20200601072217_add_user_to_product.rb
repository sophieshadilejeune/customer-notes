class AddUserToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :user, index: true
    add_reference :folders, :user, index: true
  end
end
