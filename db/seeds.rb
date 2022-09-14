# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
h1 = Hall.create(name: 'Hall 1', capacity: 20)
h2 = Hall.create(name: 'Hall 2', capacity: 50)
h3 = Hall.create(name: 'Hall 3', capacity: 50)
h4 = Hall.create(name: 'Hall 4', capacity: 50)
h5 = Hall.create(name: 'Hall 5', capacity: 50)
h6 = Hall.create(name: 'Hall 6', capacity: 100)
h7 = Hall.create(name: 'Hall 7', capacity: 100)
h8 = Hall.create(name: 'Hall 8', capacity: 100)
h9 = Hall.create(name: 'Hall 9', capacity: 100)
h10 = Hall.create(name: 'Hall 10', capacity: 200)

m1 = Movie.create(title: 'Harry Potter', description: 'Wizard movie', duration: 154)
m2 = Movie.create(title: 'Lord of The Rings', description: 'Hobbit movie', duration: 194)
m3 = Movie.create(title: 'Fast and Furious', description: 'Car movie', duration: 140)
m4 = Movie.create(title: 'James Bond', description: 'Agent movie', duration: 181)
m5 = Movie.create(title: 'Minions', description: 'Minions movie', duration: 98)
m6 = Movie.create(title: 'Hobbit', description: 'Hobbits movie', duration: 143)
m7 = Movie.create(title: 'Star Wars', description: 'Wars movie', duration: 156)
m8 = Movie.create(title: 'The Godfather', description: 'Agent movie', duration: 130)
m9 = Movie.create(title: 'Pulp Fiction', description: 'Comedy movie', duration: 100)
m10 = Movie.create(title: 'Avengers: Infinity War', description: 'Marvel movie', duration: 134)

s1 = Seance.create(movie_id: 1, hall_id: 10, starts_at: Time.now + 2.days, price: 21)
s2 = Seance.create(movie_id: 2, hall_id: 9, starts_at: Time.now + 3.days, price: 19)
s3 = Seance.create(movie_id: 3, hall_id: 8, starts_at: Time.now + 4.days, price: 17)
s4 = Seance.create(movie_id: 4, hall_id: 7, starts_at: Time.now + 1.days, price: 20)
s5 = Seance.create(movie_id: 5, hall_id: 6, starts_at: Time.now + 5.days, price: 16)
s6 = Seance.create(movie_id: 6, hall_id: 5, starts_at: Time.now + 3.days, price: 18)
s7 = Seance.create(movie_id: 7, hall_id: 4, starts_at: Time.now + 2.days, price: 22)
s8 = Seance.create(movie_id: 8, hall_id: 3, starts_at: Time.now + 5.days, price: 14)
s9 = Seance.create(movie_id: 9, hall_id: 2, starts_at: Time.now + 3.days, price: 12)
s10 = Seance.create(movie_id: 10, hall_id: 1, starts_at: Time.now + 1.days, price: 10)