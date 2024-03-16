require 'rails_helper'

RSpec.describe 'Upate Parent Record' do 
  before :each do 
    @bar1 = Bar.create!(name: "Giggling Grizzly", minimum_age: 18, rating: 7)
    visit "/bars/#{@bar1.id}/edit"
  end

  it 'I see a form to edit the parent record' do 
    fill_in('Name', with: "Purple Martini")
    fill_in("Minimum age", with: 21)
    fill_in("Rating", with: 7)
    click_button("Update #{@bar1.name}")

    expect(current_path).to eq("/bars/#{@bar1.id}")
  end
end