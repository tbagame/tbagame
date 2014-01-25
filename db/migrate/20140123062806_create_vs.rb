class CreateVs < ActiveRecord::Migration
  def change
    create_table :vs do |t|
      t.string :own_type
      t.integer :own_id
      t.datetime :vs_date
      t.string :place
      t.string :content
      t.string :status

      t.timestamps
    end
  end
end
