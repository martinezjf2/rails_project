class NotesController < ApplicationController

    def index
        @notes = Note.all
    end

    def show
        @note = Note.find_by(id: params[:id])
    end

    def new 
        #add something here based to associate the note with the book based on the url
        # binding.pry
        @note = Note.new
        @note.book_id = params[:book_id]

    end

    def create

        @note = Note.new(note_params)
        
            @note.user_id = current_user.id
        # binding.pry

            if @note.save
            redirect_to book_path(@note.book_id)
            else
            render :new
            end
    end

    def edit
        @note = Note.find_by(id: params[:id])
    end


    def update

    end

    def destroy
        @note = Note.find_by(id: params[:id])
        @note.delete
        redirect_to book_path(@note.book_id)
    end


    private

    def note_params
        params.require(:note).permit(:page_number, :summary, :book_id)
    end

end
