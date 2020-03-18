class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
            render json: @user, status: :created
        else
            render status: :conflict
        end
    end

    private
        def user_params
            params.permit(:username, :password)
        end
end
