class SessionsController < ApplicationController


    def new
    end

    
    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end

    end


    def destroy
        #make sure the hidden input field for the form and make sure the logout button is on as well

    end

end