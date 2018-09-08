class DealsPresenter
  def initialize(long, lat)
    @service = MapService.new(long, lat)
  end

  def current_address
    @service.converted_address
  end
end
