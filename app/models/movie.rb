class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, :through => :user_movies
  has_many :characters
  has_many :actors, :through => :characters
  validates_presence_of :title

  def characters_attributes=(characters_attributes)
    binding.pry
    characters_attributes.values do |value|
      binding.pry
      if !value.empty?
        @character = Character.create(name: value)
        binding.pry
      end
    end
      binding.pry
  end
end
