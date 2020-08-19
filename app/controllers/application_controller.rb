class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  
  private
    def set_current_user
      @current_user = session[:user_name]
    end
    
    def allow_logged_in
      if !@current_user
        redirect_to("/about")
      end
    end
    
    def allow_logged_out
      if @current_user
        redirect_to("/")
      end
    end
    
    def allow_proper_user
      if @current_user != params[:user_name]
        redirect_to("/")
      end
    end
end
