require 'rails_helper'

RSpec.describe UserAuthenticator, type: :service do
  let(:user) { create(:user) }
  let(:user_email) { user.email }
  let(:user_password) { user.password }

  describe '#initialize' do
    it 'will not raise error' do
      expect{ described_class.new(email: user.email, password: user.password) }.not_to raise_error
    end
  end

  describe '#call' do
    context 'when authenticating a valid user and password' do
      it 'will return a user object' do
        expect(described_class.call(user.email, user.password)).to eq(user)
      end
    end

    context 'when authenticating a invalid user' do
      it 'will return nil' do
        expect(described_class.call('bar@example.com', user.password)).
          to be_nil
      end
    end

    context 'when authenticating a invalid password' do
      it 'will return nil' do
        expect(described_class.call(user.email, 'bad_password')).to be_nil
      end
    end
  end
end
