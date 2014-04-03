class DropVs < ActiveRecord::Migration
  def up
    drop_table :vs_replies
    drop_table :vs
  end

  def down
  end
end
