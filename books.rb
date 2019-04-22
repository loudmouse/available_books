require 'pry'
require_relative 'reading_list'

# Contains info for each book
class Books
  attr_reader :books

  def initialize(reading_list)
    @books = parse_list(reading_list)
  end

  def titles
    books.collect do |book|
      title(book)
    end
  end

  def title(book)
    book[:title]
  end

  def isbns
    books.collect do |book|
      isbn(book)
    end
  end

  def isbn(book)
    book[:isbn]
  end

  Book = Struct.new(:title, :isbn)
  def parse_list(reading_list)
    reading_list.books.collect do |object|
      Book.new(object[:book][:title], object[:book][:isbn])
    end
  end
end
