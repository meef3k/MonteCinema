class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  validates :start, presence: true, comparison: { less_than: :end }
  validates :end, presence: true, comparison { greater_than: :start }
  validates :price, presence: true, numericality: { only_decimal: true, greater_than: 0}
  validates :hall_id, presence: true
  validates :movie_id, presence: true
end
