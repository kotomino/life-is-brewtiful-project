class User < ApplicationRecord
  has_many :ratings
  has_many :breweries, through: :ratings
end
