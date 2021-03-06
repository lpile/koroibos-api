require 'rails_helper'

RSpec.describe Olympic, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:games) }
  end

  describe 'associations' do
    it { should have_many(:results) }
    it { should have_many(:events).through(:results) }
  end
end
