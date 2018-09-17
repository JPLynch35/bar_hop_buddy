class BarPresenter
  attr_reader :bar
  def initialize(bar)
    @bar = bar
  end

  def day_choices(weekday)
    [bar.choices.where(click: true, created_at: prior_weekday(Date.today, weekday).all_day).length,
      bar.choices.where(click: false, created_at: prior_weekday(Date.today, weekday).all_day).length]
  end

  private
  def prior_weekday(date, weekday)
    weekday_index = Date::DAYNAMES.reverse.index(weekday)
    days_before = (date.wday + weekday_index) % 7 + 1
    date.to_date - days_before
  end
end
