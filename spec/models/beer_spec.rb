require 'rails_helper'

RSpec.describe Beer, type: :model do
  subject { build(:beer) }

  it { is_expected.to validate_presence_of(:name) }
end
