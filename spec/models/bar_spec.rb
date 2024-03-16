require 'rails_helper'

RSpec.describe Bar, type: :model do
  before :each do 
    @bar1 = Bar.create!(name: "Giggling Grizzly", minimum_age: 18, rating: 7)
    @bar2 = Bar.create!(name: "The Pour House", minimum_age: 21, rating: 9)
    @bar3 = Bar.create!(name: "Vesper Lounge", minimum_age: 18, rating: 8)
    @bar4 = Bar.create!(name: "SUR", minimum_age: 0, rating: 9)
    @bar5 = Bar.create!(name: "Whiskey Row", minimum_age: 21, rating: 4)
    @bar6 = Bar.create!(name: "Dons Club Tavern", minimum_age: 21, rating: 9)
    @drinks = create_list(:drink, 15, bar_id: @bar1.id)
  end

  describe 'relationships' do 
    it { should have_many :drink }
  end

  describe 'validations' do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :minimum_age }
    it { should validate_presence_of :rating }
  end

  describe 'model_methods' do 
    it 'orders by most recently created' do 
      expect(Bar.ordered_by_creation_time).to eq([@bar6, @bar5, @bar4, @bar3, @bar2, @bar1])
    end

    it 'returns the count of children associated with the parent' do 
      expect(@bar1.drink_count).to eq(15)
    end
  end
end
