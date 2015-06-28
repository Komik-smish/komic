class ImagesController < ApplicationController
skip_before_action :verify_authenticity_token

  def index
    @images = Image.all
    # render json: @images.as_json
    render json: @images
  end

  def show
    @image = Image.find(params[:id])

    if @image.save
      render json: { image: @image.as_json }
    else
      render json: { errors: @image.errors.full_message },
      status: :not_found
    end
  end

  def create
    @image = Image.new(image_url: params[:image_url])

    if @image.save
      render json: { image: @image.as_json }
    else
      render json: { errors: @image.errors.full_message },
      status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find_by(id: params[:id])

    if @image
      @image.destroy
      render json: { message: "Image Deleted." }
    else
      render json: { message: "Image not found." },
      status: :unprocessable_entity
    end
  end

  def create_strip
    @strip = Strip.find(params[:strip_id])
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
