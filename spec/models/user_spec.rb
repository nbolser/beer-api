require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { build(:user) }

  it { is_expected.to be_valid }
  it { is_expected.to be_a(User) }
  it { is_expected.to have_secure_password }

  describe '#email' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe 'validations' do
    let(:password) { 'password' }
    let(:confirmation) { 'password' }
    let(:user) { build(:user, password: password,
                        password_confirmation: confirmation) }

    context 'creating a new user' do
      it 'will be valid with email and suitable password' do
        expect(user).to be_valid
      end
    end

    context 'when no password is submitted' do
      let(:password) { nil }
      let(:confirmation) { nil }

      it 'will not be valid' do
        expect(user).not_to be_valid
      end
    end

    context 'when password is too short' do
      let(:password) { 'pass' }
      let(:confirmation) { 'pass' }

      it 'will not be valid' do
        expect(user).not_to be_valid
      end
    end

    context 'when password do not match' do
      let(:password) { 'pass' }
      let(:confirmation) { 'word' }

      it 'will not be valid' do
        expect(user).not_to be_valid
      end
    end
  end
end

