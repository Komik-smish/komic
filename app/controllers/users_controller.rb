  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
      @user = User.all 
      render json: {users: @user.as_json(only: [:username, :id, :email])}
    end

    def create
     passhash = Digest::SHA1.hexdigest(params[:password])
      @user = User.new(email: params[:email],
                     password: passhash,
                     username: params[:username])
      if @user.save
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:id, :email, :username]) },
        status: :created
      else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
      end
    end
  
    def login
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.find_by(password: passhash,
                         username: params[:username])
      if @user
      render json: { user: @user.as_json(only: [:email,
                                                :access_token,
                                                :full_name, 
                                                :username,
                                                :id]) },
        status: :ok
      else
      render json: { message: 'No matching username or password found.' },
        status: :not_found
      end
    end

    def show
    @user = User.find_by(id: params[:id])
      if @user
      render json: { user: @user.as_json(only: [:email,
                                                :username,
                                                :id]) },
        status: :ok
      end
    end



  end




  
