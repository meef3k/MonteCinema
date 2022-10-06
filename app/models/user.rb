class User < ApplicationRecord
  PASSWORD_LENGTH = 72
  enum role: { client: 0, cashier: 1, manager: 2 }
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  validate :password_length

  def password_length
    errors.add(:password, 'is too long') if password.nil? || password.bytesize > PASSWORD_LENGTH
  end
end
