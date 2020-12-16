# frozen_string_literal: true

require 'json'
def getMovieTitles(substr)
  base_url = "https://jsonmock.hackerrank.com/api/movies/search/?Title=#{substr}"
  samp = { "page": '1', "per_page": 10, "total": 13, "total_pages": 2,
           "data": [{ "Title": 'Italian Spiderman', "Year": 2007, "imdbID": 'tt2705436' }, { "Title": 'Superman, Spiderman or Batman', "Year": 2011, "imdbID": 'tt2084949' }, { "Title": 'Spiderman', "Year": 1990, "imdbID": 'tt0100669' }, { "Title": 'Spiderman', "Year": 2010, "imdbID": 'tt1785572' }, { "Title": 'Fighting, Flying and Driving: The Stunts of Spiderman 3', "Year": 2007, "imdbID": 'tt1132238' }, { "Title": 'Spiderman and Grandma', "Year": 2009, "imdbID": 'tt1433184' }, { "Title": 'The Amazing Spiderman T4 Premiere Special', "Year": 2012, "imdbID": 'tt2233044' }, { "Title": 'Amazing Spiderman Syndrome', "Year": 2012, "imdbID": 'tt2586634' }, { "Title": "Hollywood's Master Storytellers: Spiderman Live", "Year": 2006, "imdbID": 'tt2158533' }, { "Title": 'Spiderman 5', "Year": 2008, "imdbID": 'tt3696826' }] }
  titles = samp[:data]
  arr = []
  titles.each { |x| arr << x[:Title] }
  puts arr.sort
end

getMovieTitles('spiderman')
