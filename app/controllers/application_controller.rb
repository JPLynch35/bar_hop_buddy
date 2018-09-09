class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_location, :map_display

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_location
    session[:current_location] if session[:user_id]
  end

  def map_display(input)
    data_uri = "data:image/png;base64,#{Base64.strict_encode64(input)}"
  end
end
