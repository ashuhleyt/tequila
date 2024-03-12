require 'rails_helper'

RSpec.describe Bar, type: :model do
  describe 'relationships' do 
    it { should have_many :drink }
  end

  describe 'validations' do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :minimum_age }
    it { should validate_presence_of :rating }
  end
end
