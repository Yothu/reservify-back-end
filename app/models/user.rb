class User < ApplicationRecord
  require 'securerandom'
has_many :reservations, dependent: :delete_all
has_many :hotels, dependent: :delete_all


  has_secure_password


  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
end
