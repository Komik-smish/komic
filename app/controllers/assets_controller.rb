class AssetsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @assets = Asset.all
    render json: { assets: @assets.as_json(only: [:asset_type, :name, :asset_url])}
  end

  def create
    @asset = Asset.new(asset_type: params[:asset_type],
                       name: params[:name],
                       asset_url: params[:asset_url])

    if @asset.save
      render json: { asset: @asset.as_json(only: [:id, :asset_type,
                                                  :name, :asset_url]) },
      status: :created
    else
      render json: { errors: @asset.errors.full_message },
      status: :unprocessable_entity
    end
  end
end


#lightsaber http://imgur.com/TUpjMDX
#gun http://imgur.com/sEqgdqe
