class Character < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
  validates_presence_of :name

  def actor_attributes=(actor_attributes)
    if self.actor_id.nil?
      self.actor = Actor.new(actor_attributes)
    end
  end
end
