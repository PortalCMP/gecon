class Vehicle < ApplicationRecord
  belongs_to :person
  belongs_to :vehicle_model
  belongs_to :vehicle_color
end
