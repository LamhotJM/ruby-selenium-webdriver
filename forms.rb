
require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "http://localhost:8000/forms.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
# Tambahkan teks ke textboxes
input = wait.until {
    element = browser.find_element(:name, "searchbox")
    element if element.displayed?
}
input.send_keys("Information")
 
# Periksa apakah forms ada
form = wait.until {
    element = browser.find_element(:name, "input")
    element if element.displayed?
}
puts "Test Passed: Form input found" if form.displayed?
 
# klik button berdasarkan form  (fungsi ‘submit’ juga dapat digunakan)
form.find_element(:name, "submit").click
 
browser.quit
