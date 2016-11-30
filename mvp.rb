require "selenium-webdriver"
require "byebug"

JOBS = File.readlines('jobs.txt')

def handle_failure(err)
  puts "Something went wrong\n"
end

def closeBrowser
  DRIVER.quit
end

def find_jobs
  location = DRIVER.find_element(id: "LocationSearch")
  location.clear
  sleep(1)

  location.send_keys("San Francisco, CA")
  sleep(1)
  DRIVER.find_element(id: "KeywordSearch").send_keys("#{JOBS[0]}")

  sleep(1)

  DRIVER.find_element(class: "search")
end

def get_job_info
  job_listings = DRIVER.find_elements(class: 'jobListing')
  companies = DRIVER.find_elements(css: 'span.showHH.inline.empName')
  locations = DRIVER.find_elements(css: 'span.small.location')
end

DRIVER = Selenium::WebDriver.for :chrome
DRIVER.get("https://www.glassdoor.com/index.htm")

sleep(10)

sleep(1)
find_jobs.click
sleep(1)
get_job_info
sleep(90000)