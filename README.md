# README

#### Descriptions :

This is practice base project
Check app related files in `readme_app_data` dir


* $ bin/rails db:create && bin/rails db:migrate && bin/rails db:seed
* test user email: user1@test123.com
* $ bin/rails server -p 3001

#### Dependancies details :

* ruby : 2.7.1
* rails : 6.0.3

#### Used gems :

* gem "rspec-rails"
* gem "factory_bot_rails"
* gem 'faker'

#### Commands ::

##### Model Generations ::

```
$ bin/rails generate model User name:string email:string phone:string age:integer profile_pic:string
$ bin/rails generate model Address street:string city:string district:string state:string pincode:integer near_by_place:string user:references
$ bin/rails generate model PaymentMethod payment_type:string card_no:string card_name:string upi_address:string account_no:string account_name:string account_bank:string user:references
$ bin/rails generate model Category title:string description:text picture:string
$ bin/rails generate model Product name:string:index description:text quantity:integer:index price:integer picture:string is_active:boolean:index category:references
$ bin/rails generate model Order date:datetime:index org_number:string status:string:index user:references product:references payment_method:references address:references
$ bin/rails generate model FavouriteList date:datetime product:references user:references
$ bin/rails generate model AddToCard date:datetime quantity product:references user:references
```

##### Rails Console ::

```
  > ActiveRecord::Base.connection.tables

  > @user=User.create(name: "swapnil", email: "swapnil@test123.com", phone: "1231231234", age: 30)
  > @address=@user.addresses.create(city: "BHK")
  > @payment_method=@user.payment_methods.create(payment_type: "upi")

  > @cat=Category.create(title: 'electronics')
  > @product=@cat.products.create(name: 'hp computer')
  > @product1=@cat.products.create(name: 'dell laptop')

  > @order = Order.create(date: Time.now, status: 'processing', user_id: 1, product_id: 1, address_id: 1, payment_method_id: 1)

  > User.first.to_json(only: [:name, :email])
  > User.first.as_json(only: [:name, :email])
```

##### API Controller Generation ::

```
$ bin/rails g controller 'api/v1/api_base'
$ bin/rails g controller 'api/v1/users'
$ bin/rails g controller api/v1/Products
$ bin/rails g controller api/v1/Orders
$ bin/rails g controller api/v1/add_to_cards
$ bin/rails g controller api/v1/UserFavouriteList
```

##### API Basic List ::

```
# API's
  * Users
    - SignUp
    - SignIn
    - AddAddress
    - RemoveAddress
    - AddPaymentMethod
    - RemovePaymentMethod
    - editProfile # pending
  * Products
    - List of Product
    - Single product details
  * Orders
    - order list by user
    - order show
    - Order checkout
  * UserCart
    - card list
    - add card
    - remove card
    - updated quantity card
  * UserFavouriteList
    - favourite list
    - add favourite
    - remove favourite

```

#### Upcoming :

```
- API authentication (devise or JWT)
- User login and signout
- User authorization (Cancancan or pandit )
- Rspec test cases
     -   gem 'database_cleaner'
     -   gem 'shoulda-matchers', '~> 3.1'


```
