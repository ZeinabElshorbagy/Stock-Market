class AssetsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show]
  #before_action :authenticate_admin?, except: [:index, :show]

  def index
    render json: {assets: Asset.all}
  end

  def show
    render json: asset
  end

  def create
    @asset = Asset.create(name: asset_params['name'], price: asset_params['price'])
    if @asset.save!
      render json: {asset: @asset}, status: :created
    else
      render json: {errors: @asset.errors}, status: :unprocessable_entity
    end
  end

  def update
    if asset.update_price! asset_price_params['price']
      render json: {msg: :updated, asset: asset}, status: :created
    else
      render json: {errors: @asset.errors}, status: :unprocessable_entity
    end
  end



  private

  def asset
    @asset || Asset.find(asset_id_params['id'])
  end

  def asset_id_params
    params.permit(:id)
  end

  def asset_params
    params.require(:asset).permit(:name, :price)
  end
  def asset_price_params
    params.require(:asset).permit(:price)
  end
end
