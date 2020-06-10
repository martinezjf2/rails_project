class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def new
        @book = Book.new
        @book.notes.build
    end

    def create
        @book = Book.new(book_params)
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
            redirect_to user_book_path(@book)
        else
            render :edit
        end
    end

    def destroy
       @book = Book.find_by(id: params[:id])
        @book.delete
       redirect_to user_books_path
    end


    private

    def book_params
        params.require(:book).permit(:title, :author_first_name, :author_last_name, notes_attirbutes: [:page_number, :summary])
    end

end
