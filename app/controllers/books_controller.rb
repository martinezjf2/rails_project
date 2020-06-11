class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def new
        @book = Book.new
        @book.notes.build
    end

    def create
        # binding.pry
        @book = Book.new(book_params)
        current_user.notes << @book.notes[0]
        if @book.save
            redirect_to book_path(@book) #make sure the latest book submitted is on top
        else
            render :new
            flash[:notice] = "Please fill all requirements before submitting"
        end
    end

    def show
        @book = Book.find_by(id: params[:id])
    end

    def edit
        @book = Book.find_by(id: params[:id])
    end


    def update
        @book = Book.find_by(id: params[:id])
        @book.update(book_params)
        if @book.save
            redirect_to book_path(@book)
        else
            render :edit
        end
    end

    def destroy
       @book = Book.find_by(id: params[:id])
       @book.delete
       redirect_to books_path
       #hidden field for [:user_id]
    end


    private

    def book_params
        params.require(:book).permit(:title, :author_first_name, :author_last_name, notes_attributes: [:page_number, :summary, :id])
    end

end
