require 'rails_helper'

RSpec.describe 'Child Edit Page' do 
  before :each do 
    @bar = create(:bar)
    @drink1 = Drink.create!(name: "Hennessy", proof: 180, made_in_mexico: true, bar_id: @bar.id)
    visit "/drinks/#{@drink1.id}/edit"
  end

  it 'I see a form to edit the parent record' do 
    fill_in('Name', with: "Casamigos")
    fill_in("Proof", with: 21175)
    fill_in("Made in mexico", with: true)
    click_button("Update #{@drink1.name}")

    expect(current_path).to eq("/drinks/#{@drink1.id}")
    expect(page).to have_content("Casamigos")
    expect(page).to_not have_content("Hennessy")
  end
end