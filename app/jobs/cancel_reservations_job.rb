class CancelReservationsJob < ApplicationJob
  queue_as :default

  def perform
    outdated_reservations.each do |reservation|
      reservation.update(status: 'cancelled')
      ReservationMailer.with(reservation: reservation).reservation_cancelled.deliver_later
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
