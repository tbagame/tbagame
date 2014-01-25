class CreatePlayStatuses < ActiveRecord::Migration
  def change
    create_table :play_statuses do |t|
      t.string :own_type
      t.integer :own_id
      t.string :week_day
      t.string :start_time
      t.string :end_time
      t.string :status

      t.timestamps
    end
  end
end
