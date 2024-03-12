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
      # save_and_open_page
    end
  end
end