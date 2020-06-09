class BooksController < ApplicationController

    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        # if @book.save
        #     redirect_to user_book_path(@book)
        # else
        #     redirect_to 
        # end
    end

    def show

    end

    def update

    end

    private

    def book_params
        params.require(:book).permit(:title, :author_first_name, :author_last_name)
    end

end
