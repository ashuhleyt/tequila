class Drink < ApplicationRecord
  belongs_to :bar

  validates_presence_of :name
  validates_presence_of :proof
  validates_presence_of :made_in_mexico, presence: true

end
