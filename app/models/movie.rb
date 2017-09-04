class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, :through => :user_movies
  has_many :characters
  has_many :actors, :through => :characters
  belongs_to :genre
  validates_presence_of :title, :critic_rating, :awards
  validates_uniqueness_of :title

  scope :top_rated, -> {where("critic_rating >= 80")}

  def characters_attributes=(characters_attributes) # Now I'm not sure about this method because database of characters would get huge if they get edit
    characters_attributes.each do |k, v| #values will not work
      character = self.characters.find_or_initialize_by(name: v['name'], movie_id: self.id)
      character.quote = v['quote']
      if v['actor_id'].empty?
        actor = Actor.new(v['actor_attributes'])
        if actor.save
          character.actor = actor
          character.save
        end
      else
        character.actor = Actor.find_by(id: v['actor_id'])
        character.save
      end
    end
  end

end
