class Tower < ApplicationRecord
  belongs_to :block
  has_many :apartments
end
