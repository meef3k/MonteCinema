class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  before_validation :set_finishes_at
  validates :starts_at, :finishes_at, :price, presence: true
  validates :finishes_at, comparison: { greater_than: :starts_at }
  validates :price, numericality: { only_decimal: true, greater_than: 0 }
  
  def set_finishes_at
    self.finishes_at = starts_at + movie.duration.minutes + 60.minutes
  end
end
