class CreateChallengeReplies < ActiveRecord::Migration
  def change
    create_table :challenge_replies do |t|
      t.integer :challenge_id
      t.string :status
      t.string :description
      t.string :tel
      t.integer :team_id

      t.timestamps
    end
  end
end
