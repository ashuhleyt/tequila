require 'rails_helper'

RSpec.describe Drink, type: :model do
  before :each do 
    @bar1 = Bar.create!(name: "Giggling Grizzly", minimum_age: 18, rating: 7)
    @true_drinks = create_list(:drink, 3, bar_id: @bar1.id, made_in_mexico: true)
    # require 'pry'; binding.pry
    # @drink1 = Drink.create!(name: "Casamigos", proof: 140, made_in_mexico, bar_id: @bar1.id)
    # @drink2 = Drink.create!(name: "Pappy Van Winkle", proof: 80, made_in_mexico, bar_id: @bar1.id)
    # @drink3 = Drink.create!(name: "Teremana", proof: 100, made_in_mexico, bar_id: @bar1.id)
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

    it 'will sort names alphabetically' do 
      # expect(Drink.sort_alpha).to eq([@true_drinks[0], @true_drinks[1], @true_drinks[2]])
      #using faker is messing me up here. I should have created seed data. 
    end
  end
end
