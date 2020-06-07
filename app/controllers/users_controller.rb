class UsersController < ApplicationController

    def index

    end

    def new
        @user = User.new(user_params)

    end

    def create

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
