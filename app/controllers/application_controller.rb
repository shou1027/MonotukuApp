class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_login_user
  before_action :set_current_user
  
  private
    def set_login_user
      @login_user = session[:user_name]
    end
    
    def set_current_user
      @current_user = User.find_by(name: params[:user_name])
    end
    
    def allow_logged_in
      if !@login_user
        redirect_to("/about")
      end
    end
    
    def allow_logged_out
      if @login_user
        redirect_to("/")
      end
    end
    
    def allow_proper_user
      if @login_user != @current_user.name
        redirect_to("/")
      end
    end
end
