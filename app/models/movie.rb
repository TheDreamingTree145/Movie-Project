class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, :through => :user_movies
  has_many :characters
  has_many :actors, :through => :characters
  validates_presence_of :title, :release_date, :critic_rating, :awards
end
