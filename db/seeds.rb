# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Hall.find_or_create_by(:name => 'Hall 1', :capacity => 20)
(2..5).each do |i|
    Hall.find_or_create_by(:name => "Hall #{i}", :capacity => 50)
end
(6..9).each do |i|
    Hall.find_or_create_by(:name => "Hall #{i}", :capacity => 100)
end
Hall.find_or_create_by(:name => 'Hall 10', :capacity => 200)

Movie.find_or_create_by(:title => 'Harry Potter', :description => 'Wizard movie', :duration => 154)
Movie.find_or_create_by(:title => 'Lord of The Rings', :description => 'Hobbit movie', :duration =>  194)
Movie.find_or_create_by(:title => 'Fast and Furious', :description => 'Car movie', :duration =>  140)
Movie.find_or_create_by(:title => 'James Bond', :description => 'Agent movie', :duration =>  181)
Movie.find_or_create_by(:title => 'Minions', :description => 'Minions movie', :duration =>  98)
Movie.find_or_create_by(:title => 'Hobbit', :description => 'Hobbits movie', :duration =>  143)
Movie.find_or_create_by(:title => 'Star Wars', :description => 'Wars movie', :duration =>  156)
Movie.find_or_create_by(:title => 'The Godfather', :description => 'Agent movie', :duration =>  130)
Movie.find_or_create_by(:title => 'Pulp Fiction', :description => 'Comedy movie', :duration =>  100)
Movie.find_or_create_by(:title => 'Avengers: Infinity War', :description => 'Marvel movie', :duration =>  134)

(1..10).each do |i|
    value = 11-i
    start_time = Time.now + rand(3.days)
    t_price = (20..30).to_a.sample
    Seance.find_or_create_by(:movie_id => i, :hall_id => value, :starts_at => start_time, :price => t_price)
end

(3..10).each do |i|
    value = (i-1)*5
    Promotion.find_or_create_by(:value => i, :information => "#{value}% discount for snack set in snack bar")
  end
