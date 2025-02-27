# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Movie.destroy_all
require "json"
require "open-uri"
# assigner l'url a une variable
url = "https://tmdb.lewagon.com/movie/top_rated"
puts url
#chercher chaque cle valeur
movie_serialized = URI.parse(url).read
movies = JSON.parse(movie_serialized)["results"]
#test de chaques clefs
#les assigner a movie.create
#mettre le code dans une iteration
movies.each do |movie|
  p movie
  title = movie["title"]
  overview = movie["overview"]
  poster_url = "https://image.tmdb.org/t/p/original#{movie["poster_path"]}"
  rating = movie["vote_average"]
  Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
  puts movie
end
