class PortfolioPolicy

  def initialize(current_user, portfolio)
    @user = current_user
    @portfolio = portfolio
  end
  def can_manage?
    @user.id == @portfolio.user_id
  end
end
