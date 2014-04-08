class CreateAppointmentReplies < ActiveRecord::Migration
  def change
    create_table :appointment_replies do |t|
      t.integer :appointment_id
      t.string :status
      t.string :description
      t.string :tel
      t.integer :user_id
      t.integer :number

      t.timestamps
    end
  end
end
