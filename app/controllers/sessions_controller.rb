class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(user_auth)
    session[:user_id] = user.id
    redirect_to deals_path
  end

  def destroy
    current_user.update_attribute(:last_location, nil)
    reset_session
    redirect_to root_path
  end

  private
  def user_auth
    request.env['omniauth.auth']
  end
end
