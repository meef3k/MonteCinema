module Reservations
  class CreateMailer < ApplicationMailer
    def reservation_booked(reservation)
      @reservation = reservation

      mail(to: @reservation.email, subject: 'Your reservation in MonteCinema was booked')
    end
  end
end
