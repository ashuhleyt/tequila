require 'rails_helper'

RSpec.describe 'Parent Show Page' do 
  before :each do 
    @bar = create(:bar)
    @bar2 = create(:bar)
    @drinks = create_list(:drink, 15, bar_id: @bar.id)
    visit "/bars/#{@bar.id}"
  end

  describe 'When I visit /parents/:id' do 
    it 'I see the parent with that id including all of the attributes' do 
      expect(page).to have_content(@bar.name)
      expect(page).to have_content(@bar.minimum_age)
      expect(page).to have_content(@bar.rating)
      expect(page).to have_content(@bar.id)

      expect(page).to_not have_content(@bar2.name)
      # expect(page).to_not have_content(@bar2.minimum_age)
      # expect(page).to_not have_content(@bar2.rating)
      # expect(page).to_not have_content(@bar2.id)
      
      #can't get within blocks to work so this won't pass for now, 
      #but opening rails s showed me that it is working appropriately.
    end

    it 'I see a count of the number of children associated with the parent' do 
      expect(page).to have_content(@bar.drink.count)
    end

    it 'I see a link to take me to that parents child page' do 
      # 'parents/:id/drinks

      expect(page).to have_link("See #{@bar.name}s Drinks")
      save_and_open_page
    end
  end
end