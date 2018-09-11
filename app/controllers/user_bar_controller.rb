class UserBarController < ApplicationController
  def create
    current_user.user_bars.create(bar_id: user_bar_params[:bar_id])
    redirect_to deals_path
  end

  private
  
  def user_bar_params
    params.require(:user_bar).permit(:bar_id)
  end
end
