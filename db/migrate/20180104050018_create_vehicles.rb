class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.references :person, foreign_key: true
      t.references :vehicle_model, foreign_key: true
      t.string :license_plate
      t.references :vehicle_color, foreign_key: true

      t.timestamps
    end
  end
end
