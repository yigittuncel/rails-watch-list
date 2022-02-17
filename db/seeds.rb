Movie.destroy_all
p "Destroying all movies..."
require "json"
require "open-uri"

url = "http://tmdb.lewagon.com/movie/top_rated"
user_serialized = URI.open(url).read
json = JSON.parse(user_serialized)
results = json["results"]

base_url = "https://image.tmdb.org/t/p/w500"

results.each do |result|
  Movie.create!(
    title: result["title"],
    overview: result["overview"],
    poster_url: "#{base_url}#{result["poster_path"]}",
    rating: result["vote_average"]
  )
  p "Movie #{result["title"]} is created"
end
