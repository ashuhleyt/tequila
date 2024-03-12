require 'rails_helper'

RSpec.describe Drink, type: :model do
  describe 'relationships' do 
    it { should belong_to :bar}
  end

  describe 'validations' do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :proof }
    it { should validate_presence_of :made_in_mexico }
  end
end
