class Api::V1::UsersController < Api::V1::ApiBaseController  
  ## 
  # Post url: /api/v1/users
  #
  ##
  def create
    user = User.where(email: params[:email]).first
    if user
      render json: { data: "User already in system" }
    else
      user = User.new(user_params)
      if user.save
        render json: { data: user }
      else
        render json: { data: "Something went wrong." }, status: :unauthorized
      end
    end
  end

  def sign_in
    user = User.where(email: params[:email]).first
    if user
      render json: { data: "User Sign In Successfully" }
    else
      render json: { data: "User not found" }
    end
  end

  def sign_out
    user = User.where(email: params[:email]).first
    if user
      render json: { data: "User Sign Out Successfully" }
    else
      render json: { data: "User not found" }
    end
  end

  def add_address
    address = Address.where(user_id: params[:user_id]).first
    if address
      render json: { data: "User already have this address" }
    else
      new_address = Address.new(address_params)
      if new_address.save
        render json: { data: "User added address Successfully" }        
      else
        render json: { data: "Something went wrong." }
      end
    end
  end

  def remove_address
    address = Address.where(user_id: params[:user_id]).first
    if address && address.destroy
      render json: { data: "User removed address successfully" }
    else
      render json: { data: "Something went wrong." }
    end
  end

  def add_payment_method
    payment_method = PaymentMethod.where(user_id: params[:user_id]).first
    if payment_method
      render json: { data: "User already have this payment method" }
    else
      new_payment_method = PaymentMethod.new(payment_method_params)
      if new_payment_method.save
        render json: { data: "User added payment method Successfully" }        
      else
        render json: { data: "Something went wrong." }
      end
    end
  end

  def remove_payment_method
    payment_method = PaymentMethod.where(user_id: params[:user_id]).first
    if payment_method && payment_method.destroy
      render json: { data: "User removed payment method successfully" }
    else
      render json: { data: "Something went wrong." }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :phone, :age)
  end

  def address_params
    params.permit(:street, :city, :district, :state, :pincode, :near_by_place, :user_id)
  end

  def payment_method_params
    params.permit(:payment_type, :card_no, :card_name, :upi_address, :account_no, :account_name, :account_bank, :user_id)
  end

end
