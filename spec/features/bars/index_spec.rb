require 'rails_helper'

RSpec.describe 'Bar Index Page' do 
  before :each do 
    @bar1 = Bar.create!(name: "Giggling Grizzly", minimum_age: 18, rating: 7)
    @bar2 = Bar.create!(name: "The Pour House", minimum_age: 21, rating: 9)
    @bar3 = Bar.create!(name: "Vesper Lounge", minimum_age: 18, rating: 8)
    @bar4 = Bar.create!(name: "SUR", minimum_age: 0, rating: 9)
    @bar5 = Bar.create!(name: "Whiskey Row", minimum_age: 21, rating: 4)
    @bar6 = Bar.create!(name: "Dons Club Tavern", minimum_age: 21, rating: 9)

    visit "/bars"
  end

  describe 'Parent Index' do 
    it 'shows the name of each parent in the system' do 
      expect(page).to have_content(@bar1.name)
      expect(page).to have_content(@bar2.name)
      expect(page).to have_content(@bar3.name)
      expect(page).to have_content(@bar4.name)
      expect(page).to have_content(@bar5.name)
      expect(page).to have_content(@bar6.name)
      
    end

    it 'I see records are ordered by most recently created' do
      expect(@bar2.name).to appear_before(@bar1.name)
      expect(@bar3.name).to appear_before(@bar2.name)
      expect(@bar4.name).to appear_before(@bar3.name)
      expect(@bar5.name).to appear_before(@bar4.name)
      expect(@bar6.name).to appear_before(@bar5.name)
    end

    it 'I see a link to create a new parent' do 
      expect(page).to have_link("Create New Bar")
    end

    it 'when I click this link, im taken to parent/new where I see a form to create a new parent' do 
      click_link("Create New Bar")
      expect(current_path).to eq("/bars/new")
    end

    it 'next to every parent, I ee a link to edit their info' do 
      click_link("Edit #{@bar1.name}")
      expect(current_path).to eq("/bars/#{@bar1.id}/edit")
    end

    it 'next to every parent i see a link to delete the parent' do 
      expect(page).to have_content("Delete #{@bar1.name}")
    end

    it 'when link is clicked, return to parent index where parent is no longer displayed' do 
      expect(page).to have_content("Delete #{@bar1.name}")
      click_link("Delete #{@bar1.name}")
      expect(page).to have_current_path("/bars")
      expect(page).to_not have_content(@bar1.name)
    end
  end
end