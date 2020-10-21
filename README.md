# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## About the app
Jungle is an e-commerce application built using ruby on rails. 

- Users see products on the home page. If a product is sold out, the image will show this. 
- Clicking a product takes you through to a product description page.

[link to products view!](docs/jungle-products.png)

- Items can also be filtered by catregory

[link to description view!](docs/jungle-electronics.png)

- In the My Cart area, users can see what they have picked to buy. When the cart is empty, users will be prompted to shop for more items.

[link to my cart view!](docs/jungle-my-cart.png)
[link to empty cart view!](docs/jungle-empty-cart.png)

- The admin area is where users are able to view stats about product inventory, add categories and add products

[link to my admin view!](docs/jungle-site-stats.png)

- There is also a signup form where users can create an account.

[link to my signup view!](docs/jungle-sign-up.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
 #https://connect.stripe.com/express/oauth/authorize?redirect_uri=https://connect.stripe.com/hosted/oauth&client_id=ca_ICiSGVwBLeQRnWdXAXuLxh3Rbcg7MDQm&state=onbrd_ICiwmVqgF28kJ1DqfsUEOnZmwB&stripe_user[country]=CA