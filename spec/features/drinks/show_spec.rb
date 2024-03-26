require 'rails_helper'

RSpec.describe 'Child Show Page' do 
  before :each do 
    @bar = create(:bar)
    @drink = create(:drink, bar_id: @bar.id)
    visit "/drinks/#{@drink.id}"
  end

  describe 'when I visit /child/:id' do 
    it ' I see the attributes' do 
      expect(page).to have_content(@drink.name)
      expect(page).to have_content(@drink.proof)
      expect(page).to have_content(@drink.made_in_mexico)
      expect(page).to have_content(@drink.id)
    end

    it 'Then I see a link to update that Child "Update Child"' do 
      expect(page).to have_link("Update #{@drink.name}")
    end

    it 'click the link i am taken to drinks/id/edit where i see a form to edit attributes' do 
      expect(page).to have_link("Update #{@drink.name}")
      click_link("Update #{@drink.name}")

      expect(current_path).to eq("/drinks/#{@drink.id}/edit")
    end

    it 'I see a link to delete the parent' do 
      expect(page).to have_link("Delete #{@drink.name}")
    end

    it 'when I click the link, I am taken back to the parent index page' do 
      click_link("Delete #{@drink.name}")
      expect(current_path).to eq("/drinks")

      expect(page).to_not have_content(@drink.name)
    end
  end
end