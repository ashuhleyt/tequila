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
      click_link("Add a drink to #{@bar.name}!")

      expect(current_path).to eq("/bars/#{@bar.id}/drinks/new")
    end

    it 'I see a link to sort children alphabetically' do 
      expect(page).to have_link("Sort #{@bar.name}s Drinks Alphabetically")

      click_link("Sort #{@bar.name}s Drinks Alphabetically")
      expect(current_path).to eq("/bars/#{@bar.id}/drinks/")
    end

    it 'I see a form that allows me to input a number value' do 
  
      expect(page).to have_selector('form', text: 'Change Value')
      expect(page).to have_field('Proof', type: 'number')
      #Only return records with more than `number` of `column_name`
    end
  end
end