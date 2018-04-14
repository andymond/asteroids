class Api::V1::User::FavoritesController < ApiBaseController
  def index
    render json: current_user.favorites, each_serializer: FavoriteSerializer
  end

  def create
    favorite = current_user.favorites.create(neo_reference_id: params[:neo_reference_id])
    render json: favorite
  end
end
