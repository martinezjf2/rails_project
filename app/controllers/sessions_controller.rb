

# require 'securerandom'

class SessionsController < ApplicationController
before_action :redirect_to_login, only: [:new]

    def new
    
    end

    def fb_create
        @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
          # binding.pry
            u.first_name = auth[:info][:name].split[0]
            u.last_name = auth[:info][:name].split[1]
            u.username = auth[:info][:name]
            u.password = SecureRandom.hex #random generator
        end
          
          if @user
            session[:user_id] = @user.id
            redirect_to books_path(@user)
          else
            redirect_to login_path
          end
    end


    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to books_path
             
        else
            flash[:message] = "Sorry, Please Try Again"
            render :new
        end
        #add if statement to not render the login form when current user

    end


    def destroy
        session.delete :user_id
        redirect_to "/"
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end