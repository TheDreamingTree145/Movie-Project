class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, :through => :user_movies
  has_many :characters
  has_many :actors, :through => :characters
  belongs_to :genre
  validates_presence_of :title
  validates_uniqueness_of :title

  scope :top_rated, -> {where("critic_rating >= 80")}

  def self.top_rated
    where("critic_rating >= 80")
  end

  # Needs work on saving at proper time to make sure things aren't saved unless everything works
  def characters_attributes=(characters_attributes)
    characters_attributes.each do |k, v| #values will not work
      character = self.characters.find_or_initialize_by(name: v['name'], movie_id: self.id)
      if v['actor_id'].empty?
        actor = Actor.new(v['actor_attributes'])
        binding.pry
        if actor.save
          character.actor = actor
          character.save
        end
      else
        character.actor = Actor.find_by(id: v['actor_id'])
      end
    end
  end

end
