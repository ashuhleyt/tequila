require 'rails_helper'

RSpec.describe 'New Child' do 
  before :each do 
    @bar = create(:bar)
  end
  it 'I see a form for a new parent record' do 
    visit "/bars/#{@bar.id}/drinks/new"

    fill_in('Name', with: "Purple Martini")
    fill_in("proof", with: 21)
    fill_in("Made in mexico", with: 7)
    click_button("Create Drink")

    expect(current_path).to eq("/bars/#{@bar.id}/drinks")
    expect(page).to have_content("Purple Martini")
  end
end