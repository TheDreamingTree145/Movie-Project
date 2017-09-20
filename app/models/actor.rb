class Actor < ApplicationRecord
  has_many :characters
  has_many :movies, :through => :characters
  validates_presence_of :name
  validates_uniqueness_of :name

  def actor_award_count
    total = 0
    self.movies.each do |movie|
      total = total + movie.awards unless movie.awards.nil?
    end
    total
  end

  def highest_rated_movie
    self.movies.order("critic_rating DESC").first
  end

  def self.top_actor_awards
    self.all.select do |actor|
      if actor.actor_award_count > 24
        actor
      end
    end
  end
end
