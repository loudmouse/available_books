require 'goodreads'
require 'pry'


client = Goodreads::Client.new(api_key: ENV['GOODREADS_API_KEY'], api_secret: ENV['GOODREADS_API_SECRET'])

shelf = client.shelf(39558034, 'to-read', per_page: 200)

list = []
shelf.books.each do |object|
  list << {title: object[:book][:title], isbn: object[:book][:isbn]}
end
binding.pry
