class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  
  private
    def current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    
    def target_user
      @target_user = User.find_by(name: params[:user_name])
    end
    
    def allow_logged_in
      if !@current_user
        redirect_to("/login")
      end
    end
    
    def allow_logged_out
      if @current_user
        redirect_to("/")
      end
    end
    
    def allow_proper_user
      target_user
      
      if @current_user != @target_user
        redirect_to("/")
      end
    end
end
