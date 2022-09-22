class Reservation < ApplicationRecord
  belongs_to :seance
  belongs_to :promotion
  has_many :tickets
  validates :status, :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  enum :status, %i[booked accepted cancelled]

  def self.taken_seats(seance_id)
    includes(:tickets)
      .where(seance_id:)
      .where.not(status: :cancelled)
      .pluck('tickets.seat')
      .map(&:to_s)
  end
end
