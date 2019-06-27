class AssetsController < ApplicationController
  def index
    render json: {assets: Asset.all}
  end
end
