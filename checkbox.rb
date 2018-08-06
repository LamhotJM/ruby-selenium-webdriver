require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "http://localhost:8000/checkboxes.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
cb = browser.find_element(:name, "checkthebox")
 
# periksa apakah checkboxes ada
cb = wait.until {
    element = browser.find_element(:name, "checkthebox")
    element if element.displayed?
}
puts "Test Passed: The checkbox exists" if cb
 
# check checkboxes
cb.click
 
# Pastikan bahwa checkboxes telah ter checked
puts "Test Passed: The checkbox is selected now" if cb.selected? == true
 
sleep 2
 
# Un-Check checkbox
cb.click
 
# Pastikan bahwa checkboxes telah ter un-checked
puts "Test Passed: The checkbox is unselected now" if cb.selected? == false
 
browser.quit
