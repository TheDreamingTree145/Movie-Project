class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_date, :critic_rating
  has_many :characters
  has_many :actors, :through => :characters
end
