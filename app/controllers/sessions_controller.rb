class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(user_auth)
    session[:user_id] = user.id
    redirect_to deals_path
  end

  private
  def user_auth
    request.env['omniauth.auth']
  end
end
