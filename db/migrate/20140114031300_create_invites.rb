class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :invite_type
      t.integer :user_id
      t.integer :team_id
      t.string :status

      t.timestamps
    end
  end
end
