require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "http://localhost:8000/images.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
# Memeriksa apakah image ada, menggunakan attributes dan xpath yang berbeda


puts "Test Passed: Found a graphic with the path 'images/WaterFaucet.jpg' in the source filename" if wait.until {
    browser.find_element(:xpath => "//img[@src='images/WaterFaucet.jpg']").displayed?
}
 
puts "Test Passed: Found a graphic with the name watergraphic" if wait.until {
    browser.find_element(:name, "watergraphic").displayed?
}

puts "Test Passed: Found a graphic with 'Image of water faucet' as alt text" if wait.until {
    browser.find_element(:xpath => "//img[@alt='Image of water faucet']").displayed?
}
 
# klik button image
image = wait.until {
    element = browser.find_element(:xpath => "//img[@src='images/totoro.gif']")
    element if element.displayed?
}
image.click
 
# Periksa teks pada halaman baru
puts "Test Passed: Page 1 Validated" if wait.until {
    /Test Automation Training/.match(browser.page_source)
}
 
browser.quit
