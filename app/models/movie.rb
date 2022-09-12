class Movie < ApplicationRecord
    has_many :seances
    validates_associated :seances
    validates :name, presence: true, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }
    validates :description, presence: true, length: { maximum: 30000, too_long: "%{count} characters is the maximum allowed" }
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
