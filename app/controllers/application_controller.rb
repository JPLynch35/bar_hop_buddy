class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_location

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_location
    session[:current_location] if session[:user_id]
  end
end
