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
  movie = Movie.create!(
    title: result["title"],
    overview: result["overview"],
    poster_url: "#{base_url}#{result["poster_path"]}",
    rating: result["vote_average"]
  )
  p "Movie #{result["title"]} is created"
end

List.destroy_all

List.create!(name: "classic movies", image_url: "https://media.istockphoto.com/photos/portrait-of-retro-styled-man-vintage-black-and-white-picture-id108128488?b=1&k=20&m=108128488&s=170667a&w=0&h=jQABFwQXuDUJyMqCeZWccTXCRueJjFXkKWO5ksvb7Rs=" )
List.create!(name: "super hero", image_url: "https://media.istockphoto.com/photos/encounters-of-superheros-picture-id1192333450?b=1&k=20&m=1192333450&s=170667a&w=0&h=6FoJxaOjuVGeRuP7macB6IGKFO7goxX-HjODhhrxwNw=" )
List.create!(name: "comedy", image_url: "https://media.istockphoto.com/photos/girl-watching-a-comedy-movie-at-the-cinema-and-laughing-picture-id1281543300?b=1&k=20&m=1281543300&s=170667a&w=0&h=Q75bR0EiBzVwTTYADSQAMnYUvJExl7tBVCKpqBkYa8Y=" )
List.create!(name: "a", image_url: "https://media.istockphoto.com/photos/portrait-of-retro-styled-man-vintage-black-and-white-picture-id108128488?b=1&k=20&m=108128488&s=170667a&w=0&h=jQABFwQXuDUJyMqCeZWccTXCRueJjFXkKWO5ksvb7Rs=" )
List.create!(name: "b", image_url: "https://media.istockphoto.com/photos/encounters-of-superheros-picture-id1192333450?b=1&k=20&m=1192333450&s=170667a&w=0&h=6FoJxaOjuVGeRuP7macB6IGKFO7goxX-HjODhhrxwNw=" )
List.create!(name: "c", image_url: "https://media.istockphoto.com/photos/girl-watching-a-comedy-movie-at-the-cinema-and-laughing-picture-id1281543300?b=1&k=20&m=1281543300&s=170667a&w=0&h=Q75bR0EiBzVwTTYADSQAMnYUvJExl7tBVCKpqBkYa8Y=" )
