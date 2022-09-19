class Seance < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  before_validation :set_finishes_at, unless: :start_nil?
  validates :starts_at, :finishes_at, :price, presence: true
  validates :finishes_at, comparison: { greater_than: :starts_at }
  validates :price, numericality: { only_decimal: true, greater_than: 0 }
  validate :used?

  def set_finishes_at
    self.finishes_at = starts_at + movie.duration.minutes + ADS_TIME
  end

  def start_nil?
    starts_at.nil?
  end

  def used?
    return if hall_available?

    errors.add(:starts_at, 'Hall is used for another seance')
  end

  def hall_available?
    Seance
      .where(hall_id:)
      .where(finishes_at: starts_at..finishes_at)
      .or(Seance.where(hall_id:)
      .where(starts_at: starts_at..finishes_at))
      .empty?
  end

  def self.today_seances
    Seance
      .joins(:movie)
      .select('seances.id, seances.starts_at, seances.movie_id, movies.title as m_title')
      .where(starts_at: DateTime.current..DateTime.current.end_of_day)
      .order(:movie_id, :starts_at)
      .group_by(&:m_title)
  end
end
