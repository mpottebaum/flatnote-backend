class NotesController < ApplicationController

    def index
        user = User.find(params[:user_id])
        render json: user.notes, include: [:tags]
    end

    def create
        user = User.find(params[:user_id])
        note = user.notes.create(notes_params)
        render json: note, include: [:tags]
    end

    def show
    end

    def update
        note = Note.find(params[:id])
        note.update(notes_params)
        user = User.find(params[:user_id])
        render json: user.notes, include: [:tags]
    end

    def destroy
        note = Note.find(params[:id])
        note.destroy
        user = User.find(params[:user_id])
        render json: user.notes, include: [:tags]
    end

    private

    def notes_params
        params.require(:note).permit(:title, :content, :tagNames)
    end
end