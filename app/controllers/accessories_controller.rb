class AccessoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @accessories = Accessory.all
    # render "index.json.jbuilder"
    # render json: { accessories: @accessory.as_json }
    render json: @accessories
  end

  def create
    @accessory = Accessory.new(accessory_type: params[:accessory_type],
                       name: params[:name],
                       accessory_url: params[:accessory_url])

    if @accessory.save
      render json: { accessory: @accessory.as_json },
      status: :created
    else
      render json: { errors: @accessory.errors.full_message },
      status: :unprocessable_entity
    end
  end

  def destroy


    @accessory = Accessory.find_by(id: params[:id])
   # binding.pry
    if @accessory
      @accessory.destroy
      render json: { message: "accessory Deleted." }
    else
      render json: { message: "accessory not found." },
      status: :unprocessable_entity
    end
  end





end


#lightsaber http://imgur.com/TUpjMDX
#gun http://imgur.com/sEqgdqe
