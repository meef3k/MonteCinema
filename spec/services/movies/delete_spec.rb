require 'rails_helper'

RSpec.describe Movies::Delete do
  describe '.call' do
    let!(:movie) { create :movie }
    let(:instance) { described_class.new(movie_id: movie.id) }
    subject(:delete_movie) { instance.call }

    it 'deletes movie' do
      expect { delete_movie }.to change { Movie.count }.by(-1)
    end
  end
end
