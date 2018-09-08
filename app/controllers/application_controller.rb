class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_location, :set_cache_buster

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_location
    session[:current_location] if current_user
  end
end
