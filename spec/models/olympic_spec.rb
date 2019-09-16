require 'rails_helper'

RSpec.describe Olympic, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:games) }
    it { should validate_uniqueness_of(:games) }
  end
  
  describe 'associations' do
    it { should have_many(:results) }
  end
end
