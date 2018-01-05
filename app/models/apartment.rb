class Apartment < ApplicationRecord
  belongs_to :tower
  has_many :people
end
