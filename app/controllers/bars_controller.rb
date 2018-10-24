class BarsController < ApplicationController

  def edit
    render file: "/public/404" unless bar_owner?.id == params[:id].to_i
    @presenter = BarPresenter.new(bar_owner?)
  end

  def update
    @bar = Bar.find(params[:id])
    if bar_params['message']
      @bar.message = bar_params['message']
    else
      #maybe pull the next 5 into a private method, if for no other reason than to name it so people know what it does
      @bar.open[bar_params.values[0].keys.first.to_sym] = [bar_params.values[0].values.first]
      @bar.close[bar_params.values[1].keys.first.to_sym] = [bar_params.values[1].values.first]
      @bar.hh_start[bar_params.values[2].keys.first.to_sym] = [bar_params.values[2].values.first]
      @bar.hh_end[bar_params.values[3].keys.first.to_sym] = [bar_params.values[3].values.first]
      @bar.deals[bar_params.values[0].keys.first] = new_hh_deals
    end
    if @bar.save
      flash[:successs] = @bar.name + " successfully updated."
      redirect_to edit_bar_path(@bar)
    else
      render :edit
    end
  end

  private
  def bar_params
    params.require(:bar).permit(:message, open: days_of_week, close: days_of_week, hh_start: days_of_week, hh_end: days_of_week, deals: hh_keys)
  end

  def days_of_week
    [:Sunday, :Monday, :Tuesday, :Wednesday, :Thursday, :Friday, :Saturday]
  end

  def hh_keys
    [:first, :second, :third, :fourth, :fifth]
  end

  def new_hh_deals
    hh_keys.map do |deal|
      bar_params[:deals][deal]
    end
  end
end
