class CreateReservationsJob < ApplicationJob
  queue_as :default

  def perform(reservation)
    ::Reservations::CreateMailer.reservation_booked(reservation).deliver_now
  end
end
