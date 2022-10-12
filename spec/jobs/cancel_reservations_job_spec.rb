require 'rails_helper'

RSpec.describe CancelReservationsJob, type: :job do
  subject { CancelReservationsJob }

  describe 'cancel reservations job' do
    it 'is enqueued' do
      expect { subject.perform_later }.to enqueue_job
    end

    it 'it is processed in queue' do
      expect(subject).to be_processed_in :default
    end
  end

  describe 'cancel reservations perform' do
    let!(:seance) { create :seance, starts_at: DateTime.now }
    let!(:ticket) { create :ticket }
    let!(:reservation) { create :reservation, tickets: [ticket], seance_id: seance.id }

    it 'changes reservations status to cancelled' do
      expect { subject.perform_now }.to change { reservation.reload.status }.from('booked').to('cancelled')
    end
  end
end
