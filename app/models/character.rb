class Character < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
  accepts_nested_attributes_for :actor

  def actor_attributes=(actor_attributes)
    binding.pry
    actor_attributes.values do |value|
      @character.actor.create(name: value)
    end
  end
end
