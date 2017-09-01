class Character < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
  validates_presence_of :name
  accepts_nested_attributes_for :actor
end
