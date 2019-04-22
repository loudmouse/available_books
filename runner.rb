require_relative 'reading_list'
require_relative 'books'


reading_list = ReadingList.new.get_reading_list
books = Books.new(reading_list)
puts books.titles
puts books.isbns
