require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "http://localhost:8000/javascripts.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
# eksekusi fungsi javascript  pertama pada halaman dan cancel prompt box
browser.execute_script("enter_name()")
a = browser.switch_to.alert
if a.text == 'Please enter your name'
  a.dismiss
else
  a.accept
end
 
# eksekusi fungsi javascript  kedua pada halaman dan accept prompt box
browser.execute_script("enter_age()")
a = browser.switch_to.alert
if a.text == 'Please enter your name'
  a.dismiss
else
  a.send_keys("99")
  a.accept
end
 
# temukan umur pada page dengan menggunakan regexp
puts "Test Passed: Page Javascripts Validated" if wait.until {
    /99/.match(browser.page_source)
}
 
browser.get "http://localhost:8000/javascripts.html"
 
# eksekusi setiap custom kode Javascript 
puts browser.execute_script("return window.location.pathname")
 
browser.quit
