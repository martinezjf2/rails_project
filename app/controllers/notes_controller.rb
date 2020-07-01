class NotesController < ApplicationController
    before_action :require_login, except: [:new, :create, :show]

    def index
        @notes = all_notes
    end

    def show
        @note = find_note
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
            flash[:message] = "Successfully Saved"
        else
            render :new
        end
    end

    def edit
        @note = find_note
    end

    def update
        @note = find_note
        @note.update(note_params)
        if @note.save
            redirect_to book_path(@note.book_id)
            flash[:message] = "Note Successfully Updated"
        else
            render :edit
        end
    end

    def destroy
        @note = find_note.delete
        redirect_to book_path(@note.book_id)
        flash[:message] = "Note Successfully Deleted"
    end

    private

    def note_params
        params.require(:note).permit(:page_number, :summary, :book_id)
    end

end
