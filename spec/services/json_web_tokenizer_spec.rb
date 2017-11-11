require 'rails_helper'

RSpec.describe JsonWebTokenizer, type: :service do
  let(:user) { create(:user) }
  let(:subject_id) { { sub: user.id } }

  describe '#encode' do
    context 'when encoding a valid payload' do
      it 'will not raise error' do
        expect{ described_class.encode(subject_id) }.not_to raise_error
      end
    end
  end

  describe '#decode' do
    let(:token) { described_class.encode(subject_id) }

    context 'when decoding a valid payload' do
      it 'will not raise error' do
        expect{ described_class.decode(token) }.not_to raise_error
      end
    end

    context 'when decoding a malformated token' do
      it 'will raise error' do
        expect{ described_class.decode(token[0..-5]) }.to raise_error(JWT::VerificationError)
      end
    end

    context 'when decoding a nil token' do
      it 'will raise error' do
        expect{ described_class.decode(nil) }.to raise_error(JWT::DecodeError)
      end
    end

  end
end
