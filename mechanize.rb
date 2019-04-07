require 'mechanize'
require 'pry'

agent = Mechanize.new

page = agent.get("https://chipublib.bibliocommons.com/search")
form = page.form_with(:id => 'advanced_search')
form.field_with(:name=>"custom_query").value="identifier:(9780307388926)   branch:\"West Town\""
results = form.submit
begin
  is_available = results.at(".cp-availability-status").text
rescue NoMethodError
  nil
end
puts "Your book is available" if is_available != nil
