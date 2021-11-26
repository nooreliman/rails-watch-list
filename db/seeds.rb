# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Starting to seed movies"
Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_key%3E'
response = URI.open(url).read
movie_array = JSON.parse(response)["results"].first(10)
movie_array.each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w300" + movie["poster_path"],
    rating: movie["vote_average"]
  )
end
puts "Done seeding #{Movie.count} movies!"

require "open-uri"

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
article = Article.new(title: 'NES', body: "A great console")
article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')