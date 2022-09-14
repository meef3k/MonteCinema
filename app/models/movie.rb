class Movie < ApplicationRecord
    has_many :seances
    validates_associated :seances
    validates :title, :description, :duration, presence: true
    validates :title, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }
    validates :description, length: { maximum: 30000, too_long: "%{count} characters is the maximum allowed" }
    validates :duration, numericality: { only_integer: true, greater_than: 0 }
end
