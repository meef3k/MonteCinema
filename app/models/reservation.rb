class Reservation < ApplicationRecord
  belongs_to :seance
  has_many :tickets
  validates :status, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  enum status: { booked: 0, accepted: 1, cancelled: 2 }

  def self.taken_seats(seance_id)
    includes(:tickets)
      .where(seance_id:)
      .where.not(status: :cancelled)
      .pluck('tickets.seat')
      .map(&:to_s)
  end
end
