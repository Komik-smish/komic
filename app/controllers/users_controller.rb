  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
     passhash = Digest::SHA1.hexdigest(params[:password])
      @user = User.new(email: params[:email],
                     password: passhash)
      if @user.save
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:id, :email, :username]) },
        status: :created
      else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
      end
    end
  end