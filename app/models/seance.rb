class Seance < ApplicationRecord
  has_many :reservations
  belongs_to :hall
  belongs_to :movie
  validates :starts_at, :finishes_at, :price, presence: true
  validates :finishes_at, comparison: { greater_than: :starts_at }
  validates :price, numericality: { only_decimal: true, greater_than: 0 }

  scope :this_week, lambda {
    where(starts_at: DateTime.current.beginning_of_day..7.days.from_now)
      .order('starts_at')
  }

  def available_seats
    hall.seats - Reservation.taken_seats(id)
  end
end
