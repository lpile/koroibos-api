require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:medal) }
  end

  describe 'associations' do
    it { should belong_to(:olympian) }
    it { should belong_to(:event) }
    it { should belong_to(:olympic) }
  end
end
