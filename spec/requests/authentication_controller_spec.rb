require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user) }
  let(:email) { user.email }
  let(:password) { user.password }

  describe 'POST /api/v1/authenication' do
    before do
      post '/api/v1/auth', params: { email: email, password: password }
    end

    context 'when valid email and password is given' do
      it 'returns a 200' do
        expect(response).to have_http_status(200)
      end

      it 'has the correct payload' do
        expect(JsonWebTokenizer.decode(body)).to eq({ 'sub' => user.id })
      end
    end

    context 'when invalid email and password is given' do
      let(:email) { 'bad_email@aol.com' }

      it 'returns a 401' do
        expect(response).to have_http_status(401)
      end

      it 'returns error message' do
        json = JSON.parse(body)

        expect(json['errors']).to eq(["Invalid email or password"])
      end
    end
  end
end

