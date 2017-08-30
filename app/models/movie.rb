class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, :through => :user_movies
  has_many :characters
  has_many :actors, :through => :characters
  belongs_to :genre
  accepts_nested_attributes_for :characters
  validates_presence_of :title
  validates_uniqueness_of :title

  def characters_attributes=(characters_attributes)
    self.save
    character_1 = Character.find_or_initialize_by(name: characters_attributes.values[0]['name'], movie_id: self.id)
    character_2 = Character.find_or_initialize_by(name: characters_attributes.values[1]['name'], movie_id: self.id)
    character_3 = Character.find_or_initialize_by(name: characters_attributes.values[2]['name'], movie_id: self.id)
    if characters_attributes.values[0]['actor_id'].empty?
      @actor = Actor.create(name: characters_attributes.values[0]['actor_attributes']['name'], gender: characters_attributes.values[0]['actor_attributes']['gender'], age: characters_attributes.values[0]['actor_attributes']['age'])
      character_1.actor = @actor
      character_1.save
    else
      character_1.actor = Actor.find_by(id: characters_attributes.values[0]['actor_id'])
      character_1.save
    end
    if characters_attributes.values[1]['actor_id'].empty?
      @actor = Actor.create(name: characters_attributes.values[1]['actor_attributes']['name'], gender: characters_attributes.values[1]['actor_attributes']['gender'], age: characters_attributes.values[1]['actor_attributes']['age'])
      character_2.actor = @actor
      character_2.save
    else
      character_2.actor = Actor.find_by(id: characters_attributes.values[1]['actor_id'])
      character_2.save
    end
    if characters_attributes.values[2]['actor_id'].empty?
      @actor = Actor.create(name: characters_attributes.values[2]['actor_attributes']['name'], gender: characters_attributes.values[2]['actor_attributes']['gender'], age: characters_attributes.values[2]['actor_attributes']['age'])
      character_3.actor = @actor
      character_3.save
    else
      character_3.actor = Actor.find_by(id: characters_attributes.values[2]['actor_id'])
      character_3.save
    end
  end
end
