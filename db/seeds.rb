
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



List.create!(name: "classic", image_url: "https://media.istockphoto.com/photos/portrait-of-retro-styled-man-vintage-black-and-white-picture-id108128488?b=1&k=20&m=108128488&s=170667a&w=0&h=jQABFwQXuDUJyMqCeZWccTXCRueJjFXkKWO5ksvb7Rs=" )
List.create!(name: "super hero", image_url: "https://media.istockphoto.com/photos/encounters-of-superheros-picture-id1192333450?b=1&k=20&m=1192333450&s=170667a&w=0&h=6FoJxaOjuVGeRuP7macB6IGKFO7goxX-HjODhhrxwNw=" )
List.create!(name: "comedy", image_url: "https://media.istockphoto.com/photos/girl-watching-a-comedy-movie-at-the-cinema-and-laughing-picture-id1281543300?b=1&k=20&m=1281543300&s=170667a&w=0&h=Q75bR0EiBzVwTTYADSQAMnYUvJExl7tBVCKpqBkYa8Y=" )
List.create!(name: "adventure", image_url: "https://media.istockphoto.com/photos/chaos-on-golden-gate-bridge-picture-id1171790951?b=1&k=20&m=1171790951&s=170667a&w=0&h=zaepkwB3afUbFFY3gptoxP0V8GQ_eNJyLh_8_8C6bnI=" )
List.create!(name: "musical", image_url: "https://media.istockphoto.com/photos/film-slate-isolated-on-white-background-picture-id921149602?b=1&k=20&m=921149602&s=170667a&w=0&h=9c0uXFvOexQKiZAyvoJo_Z8y1IyWeWgkTpPLhwITS7g=" )
List.create!(name: "romance", image_url: "https://media.istockphoto.com/photos/film-projection-picture-id91370388?b=1&k=20&m=91370388&s=170667a&w=0&h=9mft3dup1R4bq2XkZKYzougLBKzoeIY-B2GZtm167YY=" )
List.create!(name: "drama", image_url: "https://images.unsplash.com/photo-1579480537892-40fce7bc35a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZHJhbWElMjBtb3ZpZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60" )
List.create!(name: "fantasy", image_url: "https://images.unsplash.com/photo-1516780236580-ef416334d5b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFudGFzeSUyMG1vdmllc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60" )
List.create!(name: "horrror", image_url: "https://media.istockphoto.com/photos/man-is-walking-through-a-very-mysterious-forest-with-a-very-old-big-picture-id1319191374?b=1&k=20&m=1319191374&s=170667a&w=0&h=bhmkqnCEW7wn2-0DpHa3Q1HWjM6RKDvx-tHB0ZXk3E0=" )
