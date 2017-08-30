class Actor < ApplicationRecord
  has_many :characters
  has_many :movies, :through => :characters
  validates_presence_of :name
  validates_uniqueness_of :name

  def actor_award_count
    total = 0
    self.movies.each do |movie|
      total = total + movie.awards
    end
    total
  end
end
