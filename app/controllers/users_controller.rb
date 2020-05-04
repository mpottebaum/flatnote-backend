class UsersController < ApplicationController

    def create
        user = User.find_or_create_by(username: user_params[:username])
        render json: user
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end