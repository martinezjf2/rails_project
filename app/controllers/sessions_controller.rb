class SessionsController < ApplicationController


    def new
    end

    def fb_create
    end


    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to books_path
        else
            flash[:message] = "Sorry please try again"
            render :new
        end

    end


    def destroy
        session.delete :user_id
        redirect_to "/"
    end

end