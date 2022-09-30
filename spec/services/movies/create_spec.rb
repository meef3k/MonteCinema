require 'rails_helper'

RSpec.describe Movies::Create do
  let(:params) do
    {
      title: 'title',
      description: 'description',
      duration: 100
    }
  end
  let(:instance) { described_class.new(params) }

  describe '.call' do
    it 'creates movie' do
      expect { instance.call }.to change { Movie.count }.by(1)
    end
  end
end
