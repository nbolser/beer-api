require 'rails_helper'

RSpec.describe 'Beers API', type: :request do
  let(:media_type) { "application/json" }
  let!(:user) { create(:user) }
  let(:token) { JsonWebTokenizer.encode({ sub: user.id }) }
  let(:authorization) { "Token token=#{token}" }
  let(:headers) { { accept: media_type, authorization: authorization } }

  before do
    create_list(:beer, 3)
  end

  describe 'GET /beers' do
    before do
      get api_v1_beers_path, headers: headers
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end

    it 'has the correct list length' do
      json = JSON.parse(body)

      expect(json['data'].count).to eq(Beer.count)
    end
  end

  describe 'GET /beer/:id' do
    let(:beer) { Beer.first }

    before do
      get api_v1_beer_path(beer)
    end

    it 'returns a 200' do
      expect(response).to have_http_status(200)
    end

    it 'responds with a single beer' do
      json = JSON.parse(body)['data']['attributes']

      expect(json['name']).to eq(beer.name)
    end
  end

  describe 'POST /beer/:id' do
    let(:attributes) { attributes_for(:beer) }
    let(:beer_params) {{
      data: {
        attributes: attributes
      }
    }}

    before do
      post api_v1_beers_path, params: beer_params
    end

    it 'returns a 200' do
      expect(response).to have_http_status(201)
    end

    it 'responds with a beer' do
      json = JSON.parse(body)['data']

      expect(json['attributes']).to include(attributes.stringify_keys)
    end
  end
end
