class BarsController < ApplicationController

  def edit
    render file: "/public/404" unless bar_owner?.id == params[:id].to_i
    @presenter = BarPresenter.new(bar_owner?)
  end

  def update
    @bar = Bar.find(params[:id])
    @bar.open[bar_params.values[0].keys.first.to_sym] = [bar_params.values[0].values.first]
    @bar.close[bar_params.values[1].keys.first.to_sym] = [bar_params.values[1].values.first]
    @bar.hh_start[bar_params.values[2].keys.first.to_sym] = [bar_params.values[2].values.first]
    @bar.hh_end[bar_params.values[3].keys.first.to_sym] = [bar_params.values[3].values.first]
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
