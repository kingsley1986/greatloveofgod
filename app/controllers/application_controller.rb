class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  before_filter :configure_devise_params, if: :devise_controller?


  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :gender, :email, :password, :password_confirmation, :phone)
    end
  end


  def authenticate_admin_user!
    unless current_user && current_user.admin?
      redirect_to root_url, alert: "Access denied, you are not authorized to view this page" and return
    end
  end
  #


  def pastor
    current_user.roles.include?("pastor")
  end
end
