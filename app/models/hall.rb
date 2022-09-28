class Hall < ApplicationRecord
  has_many :seances
  validates_associated :seances
  validates :name, :capacity, presence: true
  validates :name, uniqueness: true, length: { maximum: 255, too_long: '%<count>s characters is the maximum allowed' }
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  def seats
    (1..capacity).map(&:to_s)
  end
end
