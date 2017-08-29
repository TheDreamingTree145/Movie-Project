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
    character_1.actor = Actor.new(name: characters_attributes.values[0]['actor_attributes']['name'], gender: characters_attributes.values[0]['actor_attributes']['gender'], age: characters_attributes.values[0]['actor_attributes']['age'])
    character_2 = Character.new(name: characters_attributes.values[1]['name'], movie_id: self.id) unless characters_attributes.values[1]['name'].empty?
    character_2.actor = Actor.new(name: characters_attributes.values[1]['actor_attributes']['name'], gender: characters_attributes.values[1]['actor_attributes']['gender'], age: characters_attributes.values[1]['actor_attributes']['age'])
    character_3 = Character.new(name: characters_attributes.values[2]['name'], movie_id: self.id) unless characters_attributes.values[0]['name'].empty?
    character_3.actor = Actor.new(name: characters_attributes.values[2]['actor_attributes']['name'], gender: characters_attributes.values[2]['actor_attributes']['gender'], age: characters_attributes.values[2]['actor_attributes']['age'])
    binding.pry
    self.characters << character_1
    self.characters << character_2
    self.characters << character_3
    binding.pry
  end
end
