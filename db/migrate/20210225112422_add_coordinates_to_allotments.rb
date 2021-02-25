class AddCoordinatesToAllotments < ActiveRecord::Migration[6.0]
  def change
    add_column :allotments, :latitude, :float
    add_column :allotments, :longitude, :float
  end
end
