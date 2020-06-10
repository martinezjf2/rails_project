class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to book_path(@book) #make sure the latest book submitted is on top
        else
            render :new
        end
    end

    def show
        @book = Book.find_by(id: params[:id])
    end

    def update

    end

    private

    def book_params
        params.require(:book).permit(:title, :author_first_name, :author_last_name)
    end

end
