class UserBarController < ApplicationController
  def create
    current_user.user_bars.create(user_bar_params) unless logged_user_bar
    current_user.choices.create(click: true, bar_id: user_bar_params[:bar_id]) unless logged_choice_today
    redirect_to deals_path
  end

  def destroy
    current_user.user_bars.where(user_bar_params).destroy_all if logged_user_bar
    current_user.choices.create(click: false, bar_id: user_bar_params[:bar_id]) unless logged_choice_today
  end

  private
  
  def user_bar_params
    params.require(:user_bar).permit(:bar_id)
  end

  def logged_user_bar
    current_user.user_bars.find_by_bar_id(user_bar_params[:bar_id])
  end

  def logged_choice_today
    current_user.choices.where(bar_id: user_bar_params[:bar_id], created_at: Time.zone.now.utc.all_day).any?
  end
end
