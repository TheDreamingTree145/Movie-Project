class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, :through => :user_movies
  has_many :characters
  has_many :actors, :through => :characters
  accepts_nested_attributes_for :characters
  validates_presence_of :title

  GENRES = ["Action", "Comedy", "Drama", "Thriller", "Suspense", "Romance", "Horror", "Documentary"]

  def characters_attributes=(characters_attributes)
    self.save
    character_1 = Character.new(name: characters_attributes.values[0]['name'], movie_id: self.id) unless characters_attributes.values[0]['name'].empty?
    binding.pry
    character_1.actor = Actor.new(name: characters_attributes.values[0]['actor_attributes']['name'])
    character_1.save
    binding.pry
    self.characters << character_1
    binding.pry
  end
end
