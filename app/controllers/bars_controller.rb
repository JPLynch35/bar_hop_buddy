class BarsController < ApplicationController

  def edit
    render file: "/public/404" unless bar_owner?.id == params[:id].to_i
    @presenter = BarPresenter.new(bar_owner?)
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.update(bar_params)
    if @bar.save
      flash[:successs] = "@bar.name successfully updated."
      redirect_to edit_bar_path(@bar)
    else
      render :edit
    end
  end

  private
  def bar_params
    params.require(:bar).permit(:message, open: days_of_week, close: days_of_week, hh_start: days_of_week, hh_end: days_of_week, deals: days_of_week)
  end

  def days_of_week
    [:Sunday, :Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :Saturday]
  end
end
