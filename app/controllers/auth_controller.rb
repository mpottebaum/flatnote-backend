class AuthController < ApplicationController
    skip_before_action :authorized

    def create
        user = User.find_by(username: login_params[:username])
        if user && user.authenticate(login_params[:password])
            token = encode_token({user_id: user.id})
            render json: {user: user, jwt: token}
        else
            render json: {error: 'Username or password is incorrect'}, status: 401
        end
    end

    def show
        user = current_user
        if user
            serialized_notes = user.notes.map {|note| {id: note.id, title: note.title, content: note.content, created_at: note.created_at, updated_at: note.updated_at, tags: note.tags}}
            render json: {user: user, notes: serialized_notes}
        else
            render json: {error: 'Invalid token'}, status: 401
        end
    end

    private

    def login_params
        params.require(:auth).permit(:username, :password)
    end
end