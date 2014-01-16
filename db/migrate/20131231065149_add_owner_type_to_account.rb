class AddOwnerTypeToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :owner_type, :string
  end
end
