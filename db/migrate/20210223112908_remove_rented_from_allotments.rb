class RemoveRentedFromAllotments < ActiveRecord::Migration[6.0]
  def change
    remove_column :allotments, :rented
  end
end
