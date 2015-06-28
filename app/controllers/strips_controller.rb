class StripsController < ApplicationController
  def index
    @strips = Strip.all
    render json: @strips
  end

  def show
    @strip = Strip.find(params[:id])

    if @strip.save
      render json: { image: @strip.as_json }
    else
      render json: { errors: @strip.errors.full_message },
      status: :not_found
    end
  end

  def create
    @strip = Strip.new(name: params[:name])

    if @strip.save
      render json: { image: @strip.as_json }
    else
      render json: { errors: @strip.errors.full_message },
      status: :unprocessable_entity
    end
  end
end
