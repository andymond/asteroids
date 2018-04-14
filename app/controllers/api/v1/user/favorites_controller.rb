class Api::V1::User::FavoritesController < ApiBaseController
  def index
    render json: NasaService.new.get_favorites(current_user)
  end

  def create
    current_user.favorites.create(neo_reference_id: params[:neo_reference_id])
    render json: NasaService.new.get_asteroid(current_user, params[:neo_reference_id])
  end
end
