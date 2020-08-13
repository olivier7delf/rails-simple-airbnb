class Flat < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price_per_night, numericality: { only_integer: true, greater_than: 7 }
  validates :number_of_guest, numericality: { only_integer: true, greater_than: 0 }
end
