require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { create(:user) }

  describe 'GET /users' do
    before do
      get api_v1_users_path
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end

    it 'has the correct list length' do
      json = JSON.parse(body)

      expect(json['data'].count).to eq(User.count)
    end
  end

  describe 'GET /user/:id' do
    before do
      get api_v1_user_path(user)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end

    it 'responds with a single user' do
      json = JSON.parse(body)['data']['attributes']

      expect(json['email']).to eq(user.email)
    end
  end

  describe 'POST /user' do
    let(:attributes) { attributes_for(:user) }
    let(:user_params) {{
      data: {
        attributes: attributes
      }
    }}

    before do
      post api_v1_users_path, params: attributes
    end

    it 'returns a 201' do
      expect(response).to have_http_status(201)
    end
  end
end
