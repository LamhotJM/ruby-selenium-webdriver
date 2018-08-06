require 'rubygems'
require 'selenium-webdriver'
 
browser = Selenium::WebDriver.for :firefox
browser.get "http://localhost:8000/tables.html"
 
wait = Selenium::WebDriver::Wait.new(:timeout => 15)
 
# check apakah table dengan id ditampilkan
table = wait.until {
    element = browser.find_element(:id, "booktable")
    element if element.displayed?
}
puts "Test Passed: Book Table found" if table
 
# print semua isi tabel
puts "Table with id=booktable:\n" + table.text
 
#### Iterate through all cells of the table
browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr/td").each do |r|
    puts "Cell Value: " + r.text
end
 
# print nilai dari kolom pertama baris kedua tabel
puts "Value from the 1'st column of the 2'nd row of the table: " + browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr")[1].text.split(' ')[0]
 
# print nilai dari kolom ke 2 baris pertama tabel
puts "Value from the 2'nd column of the 1'st row of the table: " + browser.find_elements(:xpath => "//table[@id='booktable']/tbody/tr")[0].text.split(' ')[1]
 
browser.quit
