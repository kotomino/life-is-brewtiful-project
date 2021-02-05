class User < ApplicationRecord
  has_many :ratings
  has_many :breweries, through: :ratings
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email, :password
  has_secure_password
  has_one_attached :image

end
