class CreateMessageExpands < ActiveRecord::Migration
  def change
    create_table :message_expands do |t|
      t.integer :from
      t.integer :to
      t.string :status
      t.integer :message_id

      t.timestamps
    end
  end
end
