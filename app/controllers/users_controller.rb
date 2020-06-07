class UsersController < ApplicationController


    def new
        @user = User.new(user_params)
    end

    def create
        @user = User.new(artist_params)

        if @user.save
        redirect_to @user
        else
        render :new
        end
    end

    def update

    end

    def show

    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
    end
    

    
end
