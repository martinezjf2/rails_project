class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create, :home]
    def home

    end

    def new
        @user = User.new
    end

    def create
        # binding.pry
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_books_path(@user) #'/users', which is the books#index, want it to go to the new_user_book_path which is books#new
        else
            render :new
        end
    end

    # def update

    # end

    # def show

    # end

    private

    def user_params
    
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
    end
    

    
end
