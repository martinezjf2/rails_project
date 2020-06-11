class NotesController < ApplicationController

    def index
        @notes = Note.all
    end

    def show
        @note = Note.find_by(id: params[:id])
    end

    def new 
        @note = Note.new
    end

    def create
        @note = Note.new(note_params)
        if @note.save
            redirect_to book_path(@note)
        else
            render :new
        end
    end

    def update

    end

    private

    def note_params
        params.require(:note).permit(:page_number, :summary)
    end

end
