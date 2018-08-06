
select_boxes.rb
require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "http://localhost:8000/select_boxes.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
# Interaksi dengan drop down box
select_list = wait.until {
    element = browser.find_element(:name, "dropdown")
    element if element.displayed?
}
select_list.clear
 
#  Extract semua pilihan dari select box
options=select_list.find_elements(:tag_name => "option")
 

# Select pilihan “Volvo”
options.each do |g|
  if g.text == "Volvo"
  g.click
  break
  end
end
 
# Select pilihan yang lain "Audi"
options.each do |g|
  if g.text == "Audi"
  g.click
  break
  end
end
 
# Print pilihan yang sedang di-select saat ini
options.each do |g|
  if g.selected?
  puts g.text 
  end
end
 
browser.quit
