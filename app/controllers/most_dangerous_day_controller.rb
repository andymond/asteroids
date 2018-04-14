class MostDangerousDayController < ApplicationController

  def index
    @presenter = MostDangerousDayPresenter.new(date_params)
  end

  private

    def date_params
      params.permit(:start_date, :end_date)
    end
end
