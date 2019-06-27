class Asset < ApplicationRecord
  validates_presence_of :name, :price
  validates :name, uniqueness: {case_sensitive: false}, length: {minimum: 2}
  validates_uniqueness_of :name
  validates_numericality_of :price, greater_than_or_equal_to: 0, numericality: { only_float: true }

  has_many :portfolios
  has_many :users, through: :portfolios

  def update_price!(price)
    if price.present?
      self.price = price
      self.save!
    else
      erros.add(:price, 'price should exists!!!!')
    end
  end
end
