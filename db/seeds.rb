List.destroy_all
Movie.destroy_all


require 'nokogiri' # gem to handle html
require 'open-uri' # gem to open websites

def fetch_movies_urls(x)
  # define the link where to fetch info from
  imdb_top_movies_url = 'https://www.imdb.com/chart/top'
  html_file = URI.open(imdb_top_movies_url, 'Accept-Language' => 'en-US').read
  # open that link and read the html
  html_doc = Nokogiri::HTML(html_file)
  css_selector = '.lister-list td.titleColumn a'

  # search for the href of the first five movies
  result = []
  html_doc.search(css_selector).first(x).each do |element|
    # p element.text.strip
    href = element.attribute('href').value
    url = "http://www.imdb.com#{href}"
    result << url
  end

  # return an array with the first 5 urls
  return result
end

# MAIN CSS SELECTORS -
# Tags / Classes      / IDs
# h1   / .btn-primary / #header

def scrape_movie(movie_url)
  # we open the url
  html_file = URI.open(movie_url, 'Accept-Language' => 'en-US').read
  # we create the html doc
  html_doc = Nokogiri::HTML(html_file)
  # we find the right css for each of the criteria
  title = html_doc.search('h1')
  title = title.nil? ? "default title" : title.text.strip
  storyline = html_doc.search("p[class*='GenresAndPlot__Plot'] span").first
  storyline = storyline.nil? ? "default overview" : storyline.text.strip
  poster_url = html_doc.search('.ipc-media img').first.attribute('src')
  poster_url = poster_url.value unless poster_url.nil?
  rating = html_doc.search('.ipc-button__text span').first
  rating = rating.nil? ? "default rating" : rating.text

  {
    title: title,
    overview: storyline,
    poster_url: poster_url,
    rating: rating
  }
end

puts "Fetching movies urls"
top50_movie_urls = fetch_movies_urls(50)

top50_movie_urls.each do |movie_url|
  puts "Creating #{movie_url}"
  Movie.create! scrape_movie(movie_url)
end

puts "All movies created!"
