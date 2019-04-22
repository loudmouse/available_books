require 'mechanize'
require 'pry'

# Searches library website
class LibrarySearch
  attr_reader :page, :form

  def initialize
    agent = Mechanize.new
    @page = agent.get("https://chipublib.bibliocommons.com/search")
  end

  def get_search_form
    @form = page.form_with(:id => 'advanced_search')
  end

  def fill_and_submit_form
    form.field_with(:name=>"custom_query").value="identifier:(9780307388926)   branch:\"West Loop\""
    results = form.submit
    begin
      results.at(".cp-availability-status").text
      book_is_available
    rescue NoMethodError
      book_is_not_available
    end
  end

  def book_is_available
    puts "Your book is available"
  end

  def book_is_not_available
    puts "Your book is NOT available"
  end

end



library = LibrarySearch.new
library.get_search_form
library.fill_and_submit_form
