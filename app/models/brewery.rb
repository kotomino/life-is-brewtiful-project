class Brewery < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings

  validates :name, presence: true

  accepts_nested_attributes_for :ratings, reject_if: :all_blank

  paginates_per 26

  def self.search(query)
    where("LOWER(name) LIKE ? OR LOWER(city) LIKE ? OR LOWER(state) LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.alphabetize
    order(:name)
  end

end
