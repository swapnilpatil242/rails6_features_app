class Api::V1::FavouriteListController < Api::V1::ApiBaseController

  def user_product_favourite_list
    user_favourite_list = FavouriteList.where(user_id: params[:user_id])
    if user_favourite_list
      render json: { data: user_favourite_list }
    else
      render json: { data: "User doesn't have any item in favourite." }
    end
  end

  def add_product_to_favourite
    favourite_item = FavouriteList.where(product_id: params[:product_id], user_id: params[:user_id]).first
    if favourite_item
      render json: { data: "User already added this product to favourite" }
    else
      user_favourite_item = FavouriteList.new(favourite_list_params)
      user_favourite_item.date = Time.now
      if user_favourite_item.save
        render json: { data: user_favourite_item }
      else
        render json: { data: "Something went wrong." }, status: :unauthorized
      end
    end
  end

  def remove_product_from_favourite
    favourite_item = FavouriteList.where(product_id: params[:product_id], user_id: params[:user_id]).first
    if favourite_item && favourite_item.destroy
      render json: { data: "User removed product from favourite list" }
    else
      render json: { data: "Something went wrong." }, status: :unauthorized
    end
  end

  private
  def favourite_list_params
    params.require(:favourite_list).permit(:user_id, :product_id)
  end
end
