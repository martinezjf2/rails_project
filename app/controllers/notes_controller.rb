class NotesController < ApplicationController
    before_action :require_login, except: [:new, :create, :show, ]

    def index
        @notes = Note.all
    end

    def show
        @note = Note.find_by(id: params[:id])
    end

    def new 
        @note = Note.new
        @note.book_id = params[:book_id]
    end

    def create
        @note = current_user.notes.new(note_params)
        # @note.user_id = current_user.id
        if @note.save
            redirect_to book_path(@note.book_id)
            #add flash message "Successfully saved"
        else
            render :new
            #add flash messages of the errors
        end
    end

    def edit
        @note = Note.find_by(id: params[:id])
    end


    def update
        @note = Note.find_by(id: params[:id])
        @note.update(note_params)
        if @note.save
            redirect_to book_path(@note.book_id)
            #add error message "Successfully updated"
        else
            render :edit
            #add flash errors why it could not save
        end
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
