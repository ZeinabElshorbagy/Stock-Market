class Asset < ApplicationRecord
  validates_presence_of :name, :price
  validates :name, length: {minimum: 2}
  validates_numericality_of :price, greater_than_or_equal_to: 0, numericality: { only_float: true }
end
