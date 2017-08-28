class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, :through => :user_movies
  has_many :characters
  has_many :actors, :through => :characters
  accepts_nested_attributes_for :characters
  validates_presence_of :title

  def character_attributes=(character_attributes)
    character_attributes.values do
      binding.pry
    end
  end
end
