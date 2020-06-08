class UsersController < ApplicationController

    def home

    end

    def new
        @user = User.new(user_params)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
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
