class UserBarController < ApplicationController
  def create
    current_user.user_bars.create(bar_id: user_bar_params[:bar_id]) unless current_user.user_bars.find_by_bar_id(user_bar_params[:bar_id])
    redirect_to deals_path
  end

  def destroy
    current_user.user_bars.where(bar_id: user_bar_params[:bar_id]).destroy_all if current_user.user_bars.find_by_bar_id(user_bar_params[:bar_id])
  end

  private
  
  def user_bar_params
    params.require(:user_bar).permit(:bar_id)
  end
end
