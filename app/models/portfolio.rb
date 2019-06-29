class Portfolio < ApplicationRecord
  has_many :invests
  belongs_to :user
end
