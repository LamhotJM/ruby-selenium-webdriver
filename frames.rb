require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "http://localhost:8000/frames.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
# ganti ke frame pertama
browser.switch_to.frame("frame1")
 
# cari teks pada frame pertama dengan regexp
puts "Test Passed: Frame 1 Validated" if wait.until {
    /An operating system is the set of basic programs and utilities that make
your computer run/.match(browser.page_source)
}
 
# ganti ke halaman parent
browser.switch_to.default_content
 
# ganti ke frame kedua
browser.switch_to.frame("frame2")
 
# cari text pada frame kedua dengan regexp
puts "Test Passed: Frame 2 Validated" if wait.until {
    /Welcome to the Linux Kernel Archives/.match(browser.page_source)
}
 
# ganti ke halaman parent

browser.switch_to.default_content
 
# ganti ke frame ketiga

browser.switch_to.frame("frame3")
 
# cari text pada frame ketiga dengan regexp
puts "Test Passed: Frame 3 Validated" if wait.until {
    /Ubuntu is, and always will be, absolutely free/.match(browser.page_source)
}
 
browser.quit
