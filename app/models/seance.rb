class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  validates :starts_at, :finishes_at, :price, presence: true
  validates :starts_at, comparison: { less_than: :finishes_at }
  validates :finishes_at, comparison: { greater_than: :starts_at }
  validates :price, numericality: { only_decimal: true, greater_than: 0 }
end
