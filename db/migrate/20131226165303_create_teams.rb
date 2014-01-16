class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :description
      t.string :notice
      t.string :power
      t.string :declarater
      t.string :region
      t.string :area
      t.string :level
      t.string :status

      t.timestamps
    end
  end
end
