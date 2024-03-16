require 'rails_helper'

RSpec.describe Drink, type: :model do
  before :each do 
    @bar1 = Bar.create!(name: "Giggling Grizzly", minimum_age: 18, rating: 7)
    @true_drinks = create_list(:drink, 3, bar_id: @bar1.id, made_in_mexico: true)
    @false_drinks = create_list(:drink, 2, bar_id: @bar1.id, made_in_mexico: false)
  end

  describe 'relationships' do 
    it { should belong_to :bar }
  end

  describe 'validations' do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :proof }
    it { should validate_inclusion_of(:made_in_mexico).in_array([true, false]) }

    it 'validates that :made_in_mexico cannot be empty/falsy' do
      drink = Drink.new(bar_id: @bar1.id)
      drink.valid?
      expect(drink.errors[:made_in_mexico]).to include("is not included in the list")
    end
  end

  describe 'model methods' do 
    it 'will return only true records' do 
      expect(Drink.true_drinks).to match_array(@true_drinks)
    end
  end
end
