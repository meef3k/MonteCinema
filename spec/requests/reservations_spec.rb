require 'rails_helper'

RSpec.describe '/reservations', type: :request do
  let(:seance) { create :seance }
  let(:user) { create :user }

  describe 'GET /seances/id/reservations' do
    before do
      sign_in user
    end

    it 'returns success response' do
      get("/seances/#{seance.id}/reservations")
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /seances/id/reservations/id' do
    let(:reservation) { create :reservation, seance_id: seance.id }
    before do
      sign_in user
    end

    it 'returns success response' do
      get("/seances/#{seance.id}/reservations/#{reservation.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /reservation/new' do
    it 'returns success response' do
      get("/seances/#{seance.id}/reservations/new")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /reservations' do
    let(:reservation_params) do
      {
        reservation: {
          email: reservation_email,
          seats: [1, 2]
        }
      }
    end
    let(:reservation_email) { 'example@example.com' }

    it 'returns success response' do
      post("/seances/#{seance.id}/reservations", params: reservation_params)
      expect(response.status).to eq(302)
    end

    context 'when params invalid' do
      let(:reservation_email) { nil }

      it 'returns fail response' do
        post("/seances/#{seance.id}/reservations", params: reservation_params)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH/PUT /reservations/id' do
    let!(:seance) { create :seance }
    let(:reservation) { create :reservation, seance_id: seance.id }
    let(:reservation_params) do
      {
        reservation: {
          email: 'example@example.com',
          seats: [1, 2],
          status: reservation_status
        }
      }
    end
    let(:reservation_status) { 'booked' }

    it 'returns success response' do
      put("/seances/#{seance.id}/reservations/#{reservation.id}", params: reservation_params)
      expect(response.status).to eq(302)
    end
  end
end
