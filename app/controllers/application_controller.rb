class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # I don't like this too much :|
  before_filter :configure_strong_parameters, if: :devise_controller?

  # After sign-in, redirect to the ideas index
  def after_sign_in_path_for(resource)
    browse_path
  end

protected
  def configure_strong_parameters
    # Allow a Display Name to be provided when registering
    devise_parameter_sanitizer.for(:sign_up)        << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end