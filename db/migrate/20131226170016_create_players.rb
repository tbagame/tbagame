class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :height
      t.string :position
      t.string :pic
      t.integer :number
      t.string :alias
      t.float :weight
      t.string :ball_age
      t.string :description
      t.integer :team_id
      t.integer :user_id
      t.string :status
      t.string :birthday

      t.timestamps
    end
  end
end
