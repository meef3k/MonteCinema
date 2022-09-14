class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  before_validation :set_finishes_at
  validates :starts_at, :finishes_at, :price, presence: true
  validates :finishes_at, comparison: { greater_than: :starts_at }
  validates :price, numericality: { only_decimal: true, greater_than: 0 }
  validate :used?
  
  def set_finishes_at
    self.finishes_at = starts_at + movie.duration.minutes + 60.minutes
  end

  def used?
    return if hall_available?
      errors.add(:starts_at, "Hall is used for another seance")
  end

  def hall_available?
    Seance
      .where(hall_id: hall_id)
      .where(finishes_at: starts_at .. finishes_at)
      .or(Seance.where(hall_id: hall_id)
      .where(starts_at: starts_at .. finishes_at))
      .empty?
  end
end
