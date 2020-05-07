class UsersController < ApplicationController

    def create
        user = User.create(user_params)
        if user.valid?
            render json: user
        else
            render json: {message: 'Username is already taken'}, status: 401
        end
    end

    def show
    end

    def update
    end

    def destroy
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end