require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "http://localhost:8000/radio_buttons.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
#periksa apakah radio button ada
puts "Test Passed: Radio button found" if wait.until {
    browser.find_element(:name, "radiobutton1").displayed?
}
 
# ubah status dari radio buttons


cb1 = wait.until {
    element = browser.find_element(:name, "radiobutton1")
    element if element.displayed?
}
cb1.click if cb1.selected? == false
 
cb3 = wait.until {
    element = browser.find_element(:name, "radiobutton3")
    element if element.displayed?
}
cb3.click if cb3.selected? == false
 
browser.quit
