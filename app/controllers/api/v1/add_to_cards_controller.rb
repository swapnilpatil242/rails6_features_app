class Api::V1::AddToCardsController < Api::V1::ApiBaseController  
  def index
    user_card_items = AddToCard.where(user_id: params[:user_id])
    if user_card_items
      render json: { data: user_card_items }
    else
      render json: { data: "User doesn't have any item in card." }
    end
  end

  def create
    user_card_item = AddToCard.where(product_id: params[:product_id], user_id: params[:user_id]).first
    if user_card_item
      render json: { data: "User already added this product" }
    else
      user_item_card = AddToCard.new(add_to_card_params)
      user_item_card.date = Time.now
      if user_item_card.save
        render json: { data: user_item_card }
      else
        render json: { data: "Something went wrong." }, status: :unauthorized
      end
    end
  end

  def destroy
    user_card_item = AddToCard.where(product_id: params[:product_id], user_id: params[:user_id]).first
    if user_card_item && user_card_item.destroy
      render json: { data: "User removed product from card" }
    else
      render json: { data: "Something went wrong." }, status: :unauthorized
    end
  end

  def update
    user_card_item = AddToCard.where(product_id: params[:product_id], user_id: params[:user_id]).first
    if user_card_item.update(quantity: params[:quantity])
      render json: { data: "User updated product" }
    else
      render json: { data: "Something went wrong." }, status: :unauthorized
    end
  end

  private
  def add_to_card_params
    params.require(:add_to_card).permit(:quantity, :product_id, :user_id)
  end
end
