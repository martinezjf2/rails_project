class SessionsController < ApplicationController


    def new
    end

    def fb_create
        # @user = User.find_or_create_by(email: auth["info"]["email"])
        # if !@user.password
        #     @user.password = 'omniauth_password' #random generator
        # end
        # @user.save
        # session[:user_id] = @user.id
        # binding.pry
        # redirect_to books_path(@user)
        @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
            u.first_name = auth[:info][:name].split[0]
            u.last_name = auth[:info][:name].split[1]
            u.username = auth[:info][:name]
            u.password = 'omniauth_password' #random generator
            
            # binding.pry
          end
          
        #  binding.pry
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
            flash[:message] = "Sorry please try again"
            render :new
        end

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