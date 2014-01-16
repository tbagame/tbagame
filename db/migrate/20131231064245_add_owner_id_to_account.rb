class AddOwnerIdToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :owner_id, :integer
  end
end
