class CancelReservationsJob < ApplicationJob
  queue_as :default

  def perform
    outdated_reservations.each do |reservation|
      reservation.update(status: 'cancelled')
    end
  end

  private

  def outdated_reservations
    Reservation
      .joins(:seance)
      .where(status: 'booked')
      .where('seances.starts_at <= ?', Time.zone.now + 30.minutes)
  end
end
