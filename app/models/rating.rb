class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :brewery
  validates :rating, :inclusion => { :in => 1..5 }
  validates_presence_of :rating, :comment

  accepts_nested_attributes_for :brewery, reject_if: :all_blank

  
end
