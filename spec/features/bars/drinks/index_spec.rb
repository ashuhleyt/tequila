require 'rails_helper'

RSpec.describe 'Parent Child Index' do 
  before :each do 
    @bar = create(:bar)
    @drinks = create_list(:drink, 15, bar_id: @bar.id)
    visit "/bars/#{@bar.id}/drinks"
  end

  describe 'when I visit the parent to child index' do 
    it 'i see each child that is with that parent' do 
      @drinks.each do |drink|
        expect(page).to have_content(drink.name)
        expect(page).to have_content(drink.proof)
        expect(page).to have_content(drink.made_in_mexico)
      end
    end

    it 'I see a link to add a new child' do 
      expect(page).to have_link("Add a drink to #{@bar.name}!")
    end
  end
end