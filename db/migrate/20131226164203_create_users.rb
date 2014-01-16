class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :address
      t.string :name
      t.string :nickname
      t.string :tel
      t.string :qq
      t.string :status
      t.string :token

      t.timestamps
    end
  end
end
