# MonteCinema :ticket:

## Technologies

- Ruby 3.1.2
- Rails 7.0.3
- PostgreSQL 14.5
- Redis 4.8
- Sidekiq 6.5

## Installation

Clone this repository locally:
```
git clone git@github.com:meef3k/MonteCinema.git
```
Install required gems:
```
bundle install
```
Create a database with seeds:
```
rails db:create
rails db:migrate
rails db:seed
```
Run foreman
```
bin/dev
```
Run server
```
rails server
```
Run sidekiq
```
bundle exec sidekiq -q default -q mailers
```
Run redis
```
redis-server
```
Run tests
```
rspec spec/
```
**The application is ready here: [LocalHost](http://localhost:3000)**

## Online application

**The application is available on Heroku here: [MonteCinema](https://monte-cinema-meef1k.herokuapp.com/)**

### List of available accounts to test:
- **Client:** email: 'client@monte.com', password: 'password'
- **Cashier:** email: 'cashier@monte.com', password: 'password'
- **Manager:** email: 'manager@monte.com', password: 'password'

## Features
- Login and registration
- Authorization for different roles
- Internal booking system
- External/public reservation system
- Automatic reservation cancellation
- Confirmation email when a reservation is confirmed
- Cancellation email when a reservation is canceled

###
Monterail Rubycamp 2022 by [meef3k](https://www.github.com/meef3k)
