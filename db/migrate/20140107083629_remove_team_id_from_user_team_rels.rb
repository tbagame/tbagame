class RemoveTeamIdFromUserTeamRels < ActiveRecord::Migration
  def up
    remove_column :user_team_rels, :team_id
  end

  def down
    add_column :user_team_rels, :team_id, :integer
  end
end
