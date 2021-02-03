class User < ApplicationRecord
  has_many :ratings
  has_many :breweries, through: :ratings
  validates :email, presence: true, uniqueness: true

  has_secure_password

end
