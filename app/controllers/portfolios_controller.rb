class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_user, only: [:show]

  def create
    invests = portfolio_params[:invests]
    portfolio = Portfolio.create(user_id: current_user.id)
    if portfolio.save!
      invests.each do |invest|
        invest1 = Invest.create(invest_amount: invest['invest_amount'])
        invest1.user = current_user
        invest1.asset = Asset.find(invest['asset_id'])
        invest1.portfolio = portfolio
        unless invest1.save!
         render json: {msg: 'error'} and return
        end
      end
      render json: {portfolio: portfolio.as_json(include: :invests)}, status: :created
    end
  end

  def index
    render json: {portfolio: Portfolio.where('user_id = ?', current_user.id).as_json(include: [invests:
      {only: [:invest_amount, :updated_at],include:{ asset:{only:[ :name, :price, :updated_at]}}}])}
  end

  def show
    render json: {portfolio: portfolio.as_json(include: [invests:
      {only: [:invest_amount, :updated_at],include:{ asset:{only:[ :name, :price, :updated_at]}}}])}
  end

  private

  def portfolio
    @portfolio || Portfolio.find(portfolio_id_params['id'])
  end

  def portfolio_params
   params.require(:portfolio).permit(invests:[[:asset_id, :invest_amount]])
  end

  def portfolio_id_params
    params.permit(:id)
  end

  def portfolio_policy
    @portfolio_policy ||= PortfolioPolicy.new(current_user, portfolio)
  end

  def auth_user
    render json: {error: 'NOT authrized'} and return unless portfolio_policy.can_manage?
  end

end
