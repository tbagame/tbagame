class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :status
      t.string :business_time
      t.decimal :gps_x , :precision => 15, :scale => 6, null: false, default: 0
      t.decimal :gps_y , :precision => 15, :scale => 6, null: false, default: 0
      t.string :geohash
      t.decimal :average_price, :precision => 12, :scale => 2, null: false, default: 0
      t.integer :basketry
      t.string :transport_info
      t.string :telephone
      t.string :description
      t.string :province
      t.string :city
      t.string :region
      t.string :area_code, null: false, default: 'chengdu'

      t.timestamps
    end
  end
end
