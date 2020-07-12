class Api::V1::ProductsController < Api::V1::ApiBaseController  
  # GET url: /api/v1/users
  # TODO: For whole ctrl, Add model serilization and response only specific attr
  def index
    products = Product.all
    if products
      render json: { data: products }
    else
      render json: { data: "Product not found." }
    end
  end
  # GET url: /api/v1/users/1
  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: { data: product }
    else
      render json: { data: "Product not found." }
    end
  end
end
