require 'rails_helper'
RSpec.describe '/seances', type: :request do
  describe 'GET /seances' do
    it 'returns success response' do
      get('/seances')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /seances/id' do
    let(:seance) { create :seance }
    it 'returns success response' do
      get("/seances/#{seance.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /seance/new' do
    it 'returns success response' do
      get('/seances/new')
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /seances' do
    let!(:movie) { create(:movie) }
    let!(:hall) { create(:hall) }
    let(:seance_params) do
      {
        seance: {
          starts_at: DateTime.now,
          price: seance_price,
          movie_id: movie.id,
          hall_id: hall.id
        }
      }
    end
    let(:seance_price) { 20 }

    it 'returns success response' do
      post('/seances', params: seance_params)
      expect(response.status).to eq(302)
    end

    context 'when params invalid' do
      let(:seance_price) { nil }

      it 'returns fail response' do
        post('/seances', params: seance_params)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH/PUT /seances/id' do
    let!(:movie) { create(:movie) }
    let!(:hall) { create(:hall) }
    let(:seance) { create :seance }
    let(:seance_params) do
      {
        seance: {
          starts_at: DateTime.now,
          price: seance_price,
          movie_id: movie.id,
          hall_id: hall.id
        }
      }
    end
    let(:seance_price) { 20 }

    it 'returns success response' do
      put("/seances/#{seance.id}", params: seance_params)
      expect(response.status).to eq(302)
    end

    context 'when params invalid' do
      let(:seance_price) { 'price' }

      it 'returns fail response' do
        put("/seances/#{seance.id}", params: seance_params)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /seances' do
    let!(:seance) { create :seance }

    it 'returns success response' do
      delete("/seances/#{seance.id}")
      expect(response.status).to eq(302)
    end
  end
end
