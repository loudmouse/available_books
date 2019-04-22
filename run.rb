require_relative 'library_search'
require_relative 'list_connection'

library = LibrarySearch.new
library.get_search_form
connection = ListConnection.new
book_shelf = connection.get_book_shelf(39558034, 'to-read', 200)
connection.parse_book_shelf(book_shelf)
library.fill_and_submit_form(connection.get_first_isbn)
