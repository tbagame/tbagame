class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.string :status
      t.datetime :start_time
      t.datetime :end_time
      t.datetime :appointment_date
      t.string :description
      t.string :tel
      t.integer :place_id

      t.timestamps
    end
  end
end
