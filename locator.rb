require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "http://localhost:8000/locators.html"
 
# Timeout = 15 detik
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
# Mencari teks pada halaman dengan  regexp
puts "Test Passed: Page 1 Validated" if wait.until {
    /Testing Web Applications with Ruby and Selenium WebDriver/.match(browser.page_source)
}
 
browser.quit
