class Bar < ApplicationRecord
  has_many :drink

  validates_presence_of :name
  validates_presence_of :minimum_age
  validates_presence_of :rating

  def self.ordered_by_creation_time
    order(created_at: :desc)
  end

  def drink_count
    self.drink.count
  end
end
