class Drink < ApplicationRecord
  belongs_to :bar

  validates_presence_of :name
  validates_presence_of :proof
  validates :made_in_mexico, inclusion: { in: [true, false] }

  def self.true_drinks
    where(made_in_mexico: true)
  end

end
