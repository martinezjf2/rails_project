class BooksController < ApplicationController
    before_action :require_login

    def index
        @user = current_user
        if params[:search]
            @books = all_books.search(params[:search])
        else
            @books = all_books.alphabetize
        end
    end

    def new
        
        @book = Book.new
        @note = Note.new
        @book.notes.build
        # binding.pry
        
    end

    def create
        binding.pry
        @book = Book.new(book_params)
        binding.pry
        current_user.notes << @book.notes[0]
        binding.pry
        if @book.save
            redirect_to book_path(@book)
            flash[:message] = "Successful"
        else
            render :new
        end
    end

    def show
        @book = find_book
    end

    def edit
        @book = find_book
    end

    def update
        @book = find_book
        @book.update(book_params)
        if @book.save
            redirect_to book_path(@book)
        else
            render :edit
        end
    end

    def destroy
       find_book.delete
       redirect_to books_path
       #hidden field for [:user_id]
    end

    private

    def book_params
        params.require(:book).permit(:title, :author_first_name, :author_last_name, notes_attributes: [:page_number, :summary, :id])
    end
end
