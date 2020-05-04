class NotesController < ApplicationController

    def index
        user = User.find(params[:user_id])
        render json: user.notes
    end

    def create
    end

    def show
    end

    def update
    end

    def destroy
    end
end