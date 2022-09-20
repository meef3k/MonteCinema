class Reservation < ApplicationRecord
  belongs_to :seance
  belongs_to :promotion
  validates :status, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
