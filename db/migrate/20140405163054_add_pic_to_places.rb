class AddPicToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :pic, :string
  end
end
