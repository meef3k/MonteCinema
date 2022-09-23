# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
hall_capacities = [20, 50, 50, 50, 50, 100, 100, 100, 100, 200]
hall_capacities.each_with_index do |capacity, index|
    i = index + 1
    Hall.find_or_create_by(name: "Hall #{i}", capacity: capacity)
end

movie_titles = ['Harry Potter', 'Lord of The Rings', 'Fast and Furious', 'James Bond', 'Minions', 'Hobbit', 'Star Wars', 'The Godfather', 'Pulp Fiction', 'Avengers: Infinity War']
movie_titles.each do |title|
  Movie.find_or_create_by(title: title, description: "#{title} movie", duration: (100..200).to_a.sample)
end

(1..10).each do |i|
    value = 11-i
    start_time = Time.now + rand(3.days)
    t_price = (20..30).to_a.sample
    Seance.find_or_create_by(movie_id: i, hall_id: value, :starts_at => start_time, price: t_price)
end

(3..10).each do |i|
    value = (i-1)*5
    Promotion.find_or_create_by(value: i, information: "#{value}% discount for snack set in snack bar")
  end

(1..100).each do |i|
  Reservation.create(email: "example#{i}@example.com", status: (0..2).to_a.sample, seance_id: (1..10).to_a.sample)
end