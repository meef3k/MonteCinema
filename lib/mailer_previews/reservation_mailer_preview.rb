class ReservationMailerPreview < ActionMailer::Preview
  def reservation_booked
    ReservationMailer.with(reservation: Reservation.last).reservation_booked
  end

  def reservation_cancelled
    ReservationMailer.with(reservation: Reservation.last).reservation_cancelled
  end
end
