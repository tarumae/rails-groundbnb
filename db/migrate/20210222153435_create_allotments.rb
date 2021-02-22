class CreateAllotments < ActiveRecord::Migration[6.0]
  def change
    create_table :allotments do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :price
      t.boolean :rented, default: false
      t.integer :area_size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
