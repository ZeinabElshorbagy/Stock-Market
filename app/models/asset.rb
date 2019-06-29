class Asset < ApplicationRecord
  validates_presence_of :name, :price
  validates :name, uniqueness: {case_sensitive: false}, length: {minimum: 2}
  validates_uniqueness_of :name
  validates_numericality_of :price, greater_than_or_equal_to: 0, numericality: { only_float: true }

  has_many :invests
  has_many :users, through: :invests

  def update_price!(price)
    prev_price = self.price
    if price.present?
      self.price = price
      self.save!
      invests.each do |invest|
        unless invest.update_invest(prev_price, price)
          errors.add(:invest_amount, 'NOT updated')
        end
      end
    else
      errors.add(:price, 'price should exists!!!!')
    end
  end
end
