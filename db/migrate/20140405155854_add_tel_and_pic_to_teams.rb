class AddTelAndPicToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :tel, :string
    add_column :teams, :pic, :string
  end
end
