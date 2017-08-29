class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, :through => :user_movies
  has_many :characters
  has_many :actors, :through => :characters
  has_many :movie_genres
  has_many :genres, :through => :movie_genres
  accepts_nested_attributes_for :characters
  validates_presence_of :title

  def characters_attributes=(characters_attributes)
    self.save
    if !characters_attributes.values[0]['name'].empty?
      character_1 = Character.new(name: characters_attributes.values[0]['name'], movie_id: self.id)
      character_1.actor = Actor.find_or_initialize_by(id: characters_attributes.values[0]['actor_attributes']['id'], name: characters_attributes.values[0]['actor_attributes']['name'], gender: characters_attributes.values[0]['actor_attributes']['gender'], age: characters_attributes.values[0]['actor_attributes']['age'])
    end
    if !characters_attributes.values[1]['name'].empty?
      character_2 = Character.new(name: characters_attributes.values[1]['name'], movie_id: self.id)
      character_2.actor = Actor.new(name: characters_attributes.values[1]['actor_attributes']['name'], gender: characters_attributes.values[1]['actor_attributes']['gender'], age: characters_attributes.values[1]['actor_attributes']['age'])
    end
    if !characters_attributes.values[2]['name'].empty?
      character_3 = Character.new(name: characters_attributes.values[2]['name'], movie_id: self.id)
      character_3.actor = Actor.find_or_initialize_by(id: characters_attributes.values[2]['actor_attributes']['id'], name: characters_attributes.values[2]['actor_attributes']['name'], gender: characters_attributes.values[2]['actor_attributes']['gender'], age: characters_attributes.values[2]['actor_attributes']['age'])
    end
    self.characters << character_1 if character_1
    self.characters << character_2 if character_2
    self.characters << character_3 if character_3
  end
end
