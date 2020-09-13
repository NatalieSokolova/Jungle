# Jungle

A mini e-commerce application built with Rails 4.2.
A user (both registered or not) can view and purchase products through this application. An admin has the ability to create new products and categories.
Testing is dome with Rspec and Capybara
Who needs boring dress shoes when you can buy Russian Spy Shoes at Jungle? Our users can buy everything from electronics, and collectibles to clothing, furniture and other home décor. Our free website makes it easy to find items that would make you stand out in the crowd.
But do not just take my word for it, check it for yourself!

## GIFS

!["User is creating an account."](https://recordit.co/ZVQXPtqkcZ.gif)

!["User is placing an order."](https://recordit.co/dKRS51Rh4o.gif)

!["Admin is loging in and creating a new category."](https://recordit.co/MkGa0TM5SH.gif)

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

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
- Rspec 
- Capybara
