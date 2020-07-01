class ApplicationController < ActionController::Base


helper_method :current_user
#   #
  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    if current_user
      current_user
    else
        redirect_to '/'
    end
  end

  def redirect_to_login
    if current_user
      redirect_to '/books'
    end
  end

  def find_book
    Book.find_by(id: params[:id])
  end

  def all_books
    Book.all
  end

  def all_notes
    Note.all
  end

  def find_note
    Note.find_by(id: params[:id])
  end
  

end

