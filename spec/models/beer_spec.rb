require 'rails_helper'

RSpec.describe User, type: :model do
  subject { Beer.new }

  it { is_expected.to be_a(Beer) }

  describe '#name' do
    let(:beer) { create(:beer) }

    it 'is valid' do
      expect(beer).to be_valid
    end

    it 'validates presense of name' do
      expect(beer).to validate_presence_of(:name)
    end

    it 'validates uniqueness of name' do
      expect(beer).to validate_presence_of(:name)
    end
  end
end

