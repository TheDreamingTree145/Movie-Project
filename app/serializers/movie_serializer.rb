class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_date, :critic_rating, :awards
  has_many :characters
  has_many :actors, :through => :characters
end
