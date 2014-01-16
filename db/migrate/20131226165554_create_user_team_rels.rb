class CreateUserTeamRels < ActiveRecord::Migration
  def change
    create_table :user_team_rels do |t|
      t.integer :user_id
      t.integer :team_id
      t.string :part

      t.timestamps
    end
  end
end
