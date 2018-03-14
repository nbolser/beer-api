require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new }


  it { is_expected.to be_a(Comment) }
  it { is_expected.to belong_to(:commentable) }

  context 'validations' do
    let(:comment) { create(:comment) }

    it 'will be valid on save' do
      expect(comment).to be_valid
    end
  end
end
