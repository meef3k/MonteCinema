class ReservationMailer < ApplicationMailer
  def reservation_booked
    @reservation = params[:reservation]

    mail(to: @reservation.email, subject: 'Your reservation in MonteCinema was booked')
  end

  def reservation_cancelled
    @reservation = params[:reservation]

    mail(to: @reservation.email, subject: 'Your reservation in MonteCinema was cancelled')
  end
end
