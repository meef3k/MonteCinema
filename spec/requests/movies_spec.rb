require 'rails_helper'
RSpec.describe '/movies', type: :request do
  let(:user) { create :user }

  before do
    sign_in user
    request
  end

  describe 'GET /movies' do
    it 'returns success response' do
      get('/movies')
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /movies/id' do
    let(:movie) { create :movie }
    it 'returns success response' do
      get("/movies/#{movie.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /movie/new' do
    it 'returns success response' do
      get('/movies/new')
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /movies' do
    let(:movie_params) do
      {
        movie: {
          title: movie_title,
          description: 'description',
          duration: 100
        }
      }
    end
    let(:movie_title) { 'title' }

    it 'returns success response' do
      post('/movies', params: movie_params)
      expect(response.status).to eq(302)
    end

    context 'when params invalid' do
      let(:movie_title) { nil }

      it 'returns fail response' do
        post('/movies', params: movie_params)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH/PUT /movies/id' do
    let(:movie) { create :movie }
    let(:movie_params) do
      {
        movie: {
          title: 'title',
          description: 'changed description',
          duration: movie_duration
        }
      }
    end
    let(:movie_duration) { 200 }

    it 'returns success response' do
      put("/movies/#{movie.id}", params: movie_params)
      expect(response.status).to eq(302)
    end

    context 'when params invalid' do
      let(:movie_duration) { 'duration' }

      it 'returns fail response' do
        put("/movies/#{movie.id}", params: movie_params)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /movies' do
    let!(:movie) { create :movie }

    it 'returns success response' do
      delete("/movies/#{movie.id}")
      expect(response.status).to eq(302)
    end
  end
end
