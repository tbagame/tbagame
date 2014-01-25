class CreateVsReplies < ActiveRecord::Migration
  def change
    create_table :vs_replies do |t|
      t.string :own_type
      t.integer :own_id
      t.integer :vs_id
      t.string :status

      t.timestamps
    end
  end
end
