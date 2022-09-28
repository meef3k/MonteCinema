class Ticket < ApplicationRecord
  belongs_to :reservation
  validates :seat, presence: true
  validate :seat_available?

  def seat_available?
    errors.add(seat: 'Seat unavailable') unless reservation.seance.available_seats.include? seat.to_s
  end
end
