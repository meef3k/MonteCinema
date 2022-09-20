class Promotion < ApplicationRecord
  validates :amount, :value, presence: true
  validates :value, length: { maximum: 255, too_long: '%<count>s characters is the maximum allowed' }
  validates :amount, numericality: { only_integer: true, greater_than: 0 }
end
