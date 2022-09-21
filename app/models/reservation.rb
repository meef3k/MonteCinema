class Reservation < ApplicationRecord
  belongs_to :seance
  belongs_to :promotion
  has_many :tickets
  validates :status, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  enum :status, %i[booked accepted cancelled]
end
