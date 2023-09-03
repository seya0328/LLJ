class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
   
  def after_sign_in_path_for(resource)
    
    if current_user
      #flash[:notice] = "Sign in successfully."
      user_path(resource)  #指定したいパスに変更
    else
      #flash[:notice] = "Welcome! You have signed up successfully."
      user_path(resource) #指定したいパスに変更
    end
  end
  
  def after_sign_out_path_for(resource)
    
    #flash[:notice] = "Signed out successfully."
    root_path
  end

protected
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
  
  
end

