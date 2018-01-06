class AutocompleteSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name

private

  def name
    object.name
  end
end