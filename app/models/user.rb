class User < ApplicationRecord
  require 'securerandom'
  has_many :reservations, dependent: :delete_all
  has_many :hotels, dependent: :delete_all

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
end
