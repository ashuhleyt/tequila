require 'rails_helper'

RSpec.describe Drink, type: :model do
  before :each do 
    @bar1 = Bar.create!(name: "Giggling Grizzly", minimum_age: 18, rating: 7)
    @true_drinks = create_list(:drink, 3, bar_id: @bar1.id, made_in_mexico: true)
  end

  describe 'relationships' do 
    it { should belong_to :bar }
  end

  describe 'validations' do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :proof }
    it { should validate_presence_of :made_in_mexico }
  end

  describe 'model methods' do 
    it 'will return only true records' do 
      expect(Drink.true_drinks).to match_array(@true_drinks)
    end
  end
end
