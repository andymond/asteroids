class Api::V1::User::FavoritesController < ApiBaseController
  def index
    render json: NasaNeoService.new.get_favorites(current_user)
  end
end
