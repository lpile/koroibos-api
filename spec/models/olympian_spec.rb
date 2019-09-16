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

  describe 'instance methods' do
    before :each do
      @olympian = Olympian.create!(name: 'Andreea Aanei', sex: 'F', age: '22', height: '170', weight: '125', team: 'Romania')
      @olympic = Olympic.create!(games: '2016 Summer')
      @sport = Sport.create!(name: 'Weightlifting')
      @event = Event.create!(name: "Weightlifting Women's Super-Heavyweight", sport: @sport)
      @result = Result.create!(medal: 'NA', olympian: @olympian, event: @event, olympic: @olympic)
    end

    it 'sport' do
      expect(@olympian.sport).to eq(@sport.name)
    end

    it 'total_medals_won' do
      expect(@olympian.total_medals_won).to eq(0)

      @result.update(medal: 'Gold')

      expect(@olympian.total_medals_won).to eq(1)
    end
  end
end
