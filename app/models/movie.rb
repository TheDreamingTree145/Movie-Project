class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, :through => :user_movies
  has_many :characters
  has_many :actors, :through => :characters
  belongs_to :genre
  accepts_nested_attributes_for :characters
  validates_presence_of :title
  validates_uniqueness_of :title
  scope :top_rated, -> { where("critic_rating: >= 80") }


  # Needs work on saving at proper time to make sure things aren't saved unless everything works
  def characters_attributes=(characters_attributes)

    characters_attributes.each do |k, v| #values will not work
      character = self.characters.build(name: v['name']) #create not saving
      binding.pry
      if v['actor_id'].empty?
        @actor = Actor.create(v['actor_attributes'])
        character.actor = @actor
        binding.pry
      else
        character.actor = Actor.find_by(id: v['actor_id'])
      end
    end
  end

end
