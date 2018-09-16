class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :bar_owner?

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def bar_owner?
    Bar.find_by_owner_email(current_user.email) if (current_user && Bar.find_by_owner_email(current_user.email))
  end
end
