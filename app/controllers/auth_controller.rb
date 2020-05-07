class AuthController < ApplicationController
    skip_before_action :authorized

    def create
        user = User.find_by(login_params[:username])
        if user && user.authenticate(login_params[:password])
            token = encode_token({user_id: user.id}
            render json: {user: user, jwt: token}
        else
            render json: {error: 'Username or password is incorrect'}, status: 401
        end
    end

    def show

    end

    private

    def login_params
        params.require(:login).permit(:username, :password)
    end
end