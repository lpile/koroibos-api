require 'rails_helper'

RSpec.describe Olympian, type: :model do
  before :each do
    @olympian_1 = Olympian.create!(name: 'Andreea Aanei', sex: 'F', age: '22', height: '170', weight: '125', team: 'Romania')
    @olympian_2 = Olympian.create!(name: 'Samy Abdel Razek', sex: 'F', age: '36', height: '170', weight: '60', team: 'Egypt')
    @olympian_3 = Olympian.create!(name: 'Luc Abalo', sex: 'M', age: '31', height: '182', weight: '86', team: 'France')
    @olympic = Olympic.create!(games: '2016 Summer')
    @sport_1 = Sport.create!(name: 'Weightlifting')
    @sport_2 = Sport.create!(name: 'Shooting')
    @sport_3 = Sport.create!(name: 'Handball')
    @event_1 = Event.create!(name: "Weightlifting Women's Super-Heavyweight", sport: @sport_1)
    @event_2 = Event.create!(name: "Shooting Women's Air Rifle, 10 metres", sport: @sport_2)
    @event_3 = Event.create!(name: "Handball Men's Handball", sport: @sport_3)
    @result_1 = Result.create!(medal: 'NA', olympian: @olympian_1, event: @event_1, olympic: @olympic)
    @result_2 = Result.create!(medal: 'NA', olympian: @olympian_2, event: @event_2, olympic: @olympic)
    @result_3 = Result.create!(medal: 'Silver', olympian: @olympian_3, event: @event_3, olympic: @olympic)
  end

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

  describe 'class methods' do
    it 'average_age' do
      expect(Olympian.average_age).to eq(29.7)
    end

    it 'average_female_weight' do
      expect(Olympian.average_female_weight).to eq(92.5)
    end

    it 'average_male_weight' do
      expect(Olympian.average_male_weight).to eq(86.0)
    end

    it 'request_age(request)' do
      expect(Olympian.request_age('youngest')).to eq(@olympian_1)
      expect(Olympian.request_age('oldest')).to eq(@olympian_2)
    end

    it 'total_count' do
      expect(Olympian.total_count).to eq(3)
    end
  end

  describe 'instance methods' do
    it 'sport' do
      expect(@olympian_1.sport).to eq(@sport_1.name)
    end

    it 'total_medals_won' do
      expect(@olympian_1.total_medals_won).to eq(0)

      @result_1.update(medal: 'Gold')

      expect(@olympian_1.total_medals_won).to eq(1)
    end
  end
end
