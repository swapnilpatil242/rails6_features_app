class Api::V1::OrdersController < Api::V1::ApiBaseController

  def index
    orders = Order.where(user_id: params[:user_id])
    if orders
      render json: { data: orders }
    else
      render json: { data: "Order not found." }
    end
  end

  def create
    order = Order.where(product_id: params[:product_id], user_id: params[:user_id], status: 'processing').first
    if order
      render json: { data: "User already ordered this item." }
    else
      byebug
      new_order = Order.new(order_params)
      new_order.status = "processing"
      new_order.date = Time.now
      new_order.org_number = Faker::Alphanumeric.alphanumeric(number: 10)
      if new_order.save!
        render json: { data: "Order placed successfully." }
      else
        render json: { data: "Something went wrong." }, status: :unauthorized
      end
    end
  end

  def show
    order = Order.where(id: params[:id]).first
    if order
      render json: { data: order }
    else
      render json: { data: "Order not found." }
    end
  end

  private
  def order_params
    params.require(:order).permit(:quantity, :price, :discount, :status_comment, :description, :user_id, :product_id, :payment_method_id, :address_id)
  end
end
