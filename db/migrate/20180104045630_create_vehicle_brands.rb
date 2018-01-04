class CreateVehicleBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_brands do |t|
      t.string :name

      t.timestamps
    end
  end
end
