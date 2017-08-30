class Actor < ApplicationRecord
  has_many :characters
  has_many :movies, :through => :characters
  validates_presence_of :name
  validates_uniqueness_of :name
end
