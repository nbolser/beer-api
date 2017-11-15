require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { create(:beer) }

  it { is_expected.to be_valid }
  it { is_expected.to be_a(Beer) }

  describe '#name' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end

