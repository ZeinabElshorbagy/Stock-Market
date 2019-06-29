class Invest < ApplicationRecord
  belongs_to :user
  belongs_to :asset
  belongs_to :portfolio


  def update_invest(prev_price, price)
    self.invest_amount = new_invest(calc_new_invest(prev_price, price))
    save!
  end

  private
  def calc_new_invest(prev_price, price)
    invest_amount + ((invest_amount/prev_price) * (price-prev_price))
  end

  def new_invest(new_invest_amount)
    new_invest_amount < 0 ? 0 : new_invest_amount
  end
end
