class Brewery < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  validates :name, presence: true
  paginates_per 26

  def self.search(query)
    where("LOWER(name) LIKE ? OR LOWER(city) LIKE ? OR LOWER(state) LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.alphabetize
    order(:name)
  end

end
