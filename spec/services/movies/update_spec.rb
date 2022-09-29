require 'rails_helper'

RSpec.describe Movies::Update do
  describe '.call' do
    let(:movie) { create :movie }
    let(:movie_params) do
      {
        title: 'changed title',
        description: 'changed description',
        duration: 200
      }
    end
    subject(:update_movie) { described_class.new(movie_id: movie.id, params: movie_params).call }

    it 'updates movie attributes' do
      expect { update_movie }
        .to change { movie.reload.title }.from('title').to('changed title')
        .and change { movie.reload.description }.from('description').to('changed description')
        .and change { movie.reload.duration }.from(100).to(200)
    end
  end
end
