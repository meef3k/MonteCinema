class Movie < ApplicationRecord
  has_many :seances
  validates_associated :seances
  validates :title, :description, :duration, presence: true
  validates :title, length: { maximum: 255, too_long: '%<count>s characters is the maximum allowed' }
  validates :description, length: { maximum: 30_000, too_long: '%<count>s characters is the maximum allowed' }
  validates :duration, numericality: { only_integer: true, greater_than: 0 }

  def self.today
    includes(:seances)
      .where(seances: { starts_at: DateTime.current.beginning_of_day...DateTime.current.end_of_day })
      .order('seances.starts_at')
  end
end
