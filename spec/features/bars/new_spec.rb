require 'rails_helper'

RSpec.describe 'Parent Creation' do 
  it 'I see a form for a new parent record' do 
    visit "/bars/new"

    fill_in('Name', with: "Purple Martini")
    fill_in("Minimum age", with: 21)
    fill_in("Rating", with: 7)
    click_button("Create Bar")

    expect(current_path).to eq("/bars")
    expect(page).to have_content("Purple Martini")
  end
end