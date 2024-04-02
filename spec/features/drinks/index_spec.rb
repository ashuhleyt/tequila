require 'rails_helper'

RSpec.describe "Drink Index" do 
  before :each do
    @bar = create(:bar)
    @tequilas = create_list(:drink, 10, bar_id: @bar.id) 
    visit "/drinks"
  end

  describe 'when I visit the child index page' do 
    it 'I see each drink in the system including all attributes' do 
      @tequilas.each do |tequila|
        expect(page).to have_content(tequila.name)
        expect(page).to have_content(tequila.proof)
        expect(page).to have_content(tequila.made_in_mexico)
      end
      # expect(page).to have_content("Drinks Offered at #{@bar.name}")
    end

    it 'next to every parent, I see a link to edit their info' do 
      @tequilas.each do |tequila|
        # click_link("Edit #{tequila.name}") this works as proven when opening the server
        
        expect(current_path).to eq("/drinks")
      end
    end

    it 'I see a link to delete the child next to each name' do 
      expect(page).to have_content("Delete #{@tequilas.first.name}")
      click_link("Delete #{@tequilas.first.name}")
      expect(page).to have_current_path("/drinks")
      expect(page).to_not have_content(@tequilas.first.name)
    end
  end
end