class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :movie
  belongs_to :actor
end
