require 'pg'
require 'httparty'
require 'json'


print "Press 1 to find a movie or 2 to quit"
answer = gets.chomp

while answer != 2

  print "Type the title of the movie you're looking for: "
  name = gets.chomp.to_s.gsub(" ", "+")


 movie = JSON(HTTParty.get("http://www.omdbapi.com/?i=&t=#{name}"))
  puts movie

  sql =  "INSERT INTO moviez (title, released, rated, genre, director, plot)  VALUES ('#{movie['Title']}', '#{movie['Released']}', '#{movie['Rated']}','#{movie['Genre']}','#{movie['Director']}' ,'#{movie['Plot']}');"

       conn = PG.connect(:dbname => 'moviez', :host => 'localhost')
       conn.exec(sql)
       conn.close

end



