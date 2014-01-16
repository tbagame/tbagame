class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :content
      t.integer :pid
      t.string :message_type

      t.timestamps
    end
  end
end
