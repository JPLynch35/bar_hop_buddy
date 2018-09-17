class SessionsController < ApplicationController
  
  def create
    user = User.from_omniauth(user_auth)
    session[:user_id] = user.id
    redirect_to deals_path
  end

  def destroy
    UserBar.where(user_id: current_user.id).delete_all
    current_user.update_attributes(last_location: nil, last_long: nil, last_lat: nil)
    reset_session
    redirect_to root_path
  end

  private
  def user_auth
    request.env['omniauth.auth']
  end
end
