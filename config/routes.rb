Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # users api
      # prefix: /api/v1/users/...
      resources :users, except: [:destroy, :create, :new, :edit] do
        collection do
          post :create, :path => "sign_up"
          post :sign_in, :path => "sign_in"
          post :sign_out, :path => "sign_out"
          post :add_address
          delete :remove_address
          post :add_payment_method
          delete :remove_payment_method
        end
      end
      # products api
      # prefix: /api/v1/products
      resources :products, only: [:index, :show]
      # add to card api
      # prefix: /api/v1/add_to_cards
      resources :add_to_cards, except: [:new, :edit, :show]

      # oders api
      #prefix: /api/v1/orders
      resources :orders, except: [:new, :edit, :update, :destroy]

      # add to favourite
      match '/user_product_favourite_list' => 'favourite_list#user_product_favourite_list', via: :get
      match '/remove_product_from_favourite' => 'favourite_list#remove_product_from_favourite', via: :post
      match '/add_product_to_favourite' => 'favourite_list#add_product_to_favourite', via: :post
    end #v1
  end #api

end
