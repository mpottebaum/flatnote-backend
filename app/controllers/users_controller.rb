class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.create(user_params)
        if user.valid?
            token = encode_token(user_id: user.id)
            render json: {user: user, jwt: token}
        else
            render json: {error: 'Username is already taken'}, status: 406
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end