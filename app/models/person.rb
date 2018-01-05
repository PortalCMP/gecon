class Person < ApplicationRecord
  belongs_to :apartment
  belongs_to :person_type

  enum gender: [ :male, :female, :uninformed ]

end
