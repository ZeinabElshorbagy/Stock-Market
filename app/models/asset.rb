class Asset < ApplicationRecord
  validates_presence_of :name, :price
  validates :name, uniqueness: {case_sensitive: false}, length: {minimum: 2}
  validates_uniqueness_of :name
  validates_numericality_of :price, greater_than_or_equal_to: 0, numericality: { only_float: true }
end
