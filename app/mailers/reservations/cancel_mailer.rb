module Reservations
  class CancelMailer < ApplicationMailer
    def reservation_cancelled(reservation)
      @reservation = reservation

      mail(to: @reservation.email, subject: 'Your reservation in MonteCinema was cancelled')
    end
  end
end
