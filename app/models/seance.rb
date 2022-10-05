class Seance < ApplicationRecord
  has_many :reservations
  belongs_to :hall
  belongs_to :movie
  before_validation :set_finishes_at, unless: :start_nil?
  validates :starts_at, :finishes_at, :price, presence: true
  validates :finishes_at, comparison: { greater_than: :starts_at }
  validates :price, numericality: { only_decimal: true, greater_than: 0 }
  validate :used?

  scope :this_week, lambda {
    where(starts_at: DateTime.current.beginning_of_day..7.days.from_now)
      .order('starts_at')
  }

  def set_finishes_at
    self.finishes_at = starts_at + movie.duration.minutes + ADS_TIME
  end

  def start_nil?
    starts_at.nil?
  end

  def time_period
    starts_at..finishes_at
  end

  def used?
    seances = Seance.where(hall_id:).where.not(id:)

    overlaps = seances.any? do |s|
      time_period.overlaps?(s.time_period)
    end

    errors.add(:overlaps_time_period, 'Hall is used for another seance') if overlaps

    !overlaps
  end

  def available_seats
    hall.seats - Reservation.taken_seats(id)
  end
end
