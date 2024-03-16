require 'rails_helper'

RSpec.describe "Drink Index" do 
  before :each do
    @bar = create(:bar)
    @tequilas = create_list(:drink, 10, bar_id: @bar.id)
    @drink1 = Drink.create!(name: "Smirnoff", proof: 80, 
      made_in_mexico: false, bar_id: @bar.id)
      
    visit "/drinks"
  end

  describe 'when I visit the child index page' do 
    it 'I see each drink in the system including all attributes' do 
      @tequilas.each do |tequila|
        expect(page).to have_content(tequila.name)
        expect(page).to have_content(tequila.proof)
        expect(page).to have_content(tequila.made_in_mexico)
      end
      expect(page).to have_content("Drinks Offered at #{@bar.name}")
    end

    it 'only shows true records' do 
      @tequilas.each do |tequila|
        expect(page).to have_content(tequila.name)
        expect(page).to have_content(tequila.proof)
        expect(page).to have_content(tequila.made_in_mexico)
      end

      expect(page).to_not have_content(@drink1.name)
    end
  end
end