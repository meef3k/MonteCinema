class User < ApplicationRecord
  PASSWORD_LENGTH = 72
  enum :role, %i[client cashier manager]
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validate :password_length

  def password_length
    errors.add(:password, 'Password is too long') if password.nil? || password.bytesize > PASSWORD_LENGTH
  end
end
