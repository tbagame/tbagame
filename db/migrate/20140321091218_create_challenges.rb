class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :team_id
      t.string :status
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :challenge_date
      t.string :description
      t.integer :place_id
      t.string :tel

      t.timestamps
    end
  end
end
