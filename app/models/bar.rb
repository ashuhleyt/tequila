class Bar < ApplicationRecord
  has_many :drink

  validates_presence_of :name
  validates_presence_of :minimum_age
  validates_presence_of :rating
end
