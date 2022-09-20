class Promotion < ApplicationRecord
  has_many :seances
  validates :value, :information, presence: true
  validates :value, numericality: { only_integer: true, greater_than: 0 }
  validates :information, length: { maximum: 255, too_long: '%<count>s characters is the maximum allowed' }
end
