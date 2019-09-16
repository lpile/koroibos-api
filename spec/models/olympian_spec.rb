require 'rails_helper'

RSpec.describe Olympian, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:sex) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:weight) }
    it { should validate_presence_of(:team) }
  end

  describe 'associations' do
    it { should have_many(:results) }
    it { should have_many(:olympics).through(:results) }
    it { should have_many(:events).through(:results) }
  end
end
