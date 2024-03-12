require 'rails_helper'

RSpec.describe 'Bar Index Page' do 
  before :each do 
    @bars = create_list(:bar, 3)
    visit "/parents"
  end

  describe 'Parent Index' do 
    it 'shows the name of each parent in the system' do 
      @bars.each do |bar|
        expect(page).to have_content(bar.name)
      end

      save_and_open_page
      
    end
  end
end