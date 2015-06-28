class StripsController < ApplicationController
  def index
    @strips = Strip.all
    render json: @strips
  end

  def show
    @strip = Strip.find(params[:id])

    if @strip.save
      render json: { strip: @strip.as_json, image: @strip.images.all.as_json }
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

  def create_strip
    @strip = Strip.find_or_create_by(params[:name])
    @image = Image.find(params[:image_id])
    if @image
      @image.update(strip_id: @strip.id)
      render json: @image
    else
      render json: { message: "Image not found." },
      status: :unprocessable_entity
    end
  end
end
