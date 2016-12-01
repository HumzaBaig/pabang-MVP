require_relative "../modules/selenium.rb"
require_relative "../modules/io.rb"

include IOStream
include Selenium

DRIVER = Selenium::DRIVER

def search_jobs

  location = IOStream::input_locations
  position = IOStream::input_positions

  location_input = DRIVER.find_element(id: "LocationSearch")
  location_input.clear
  location_input.send_keys(location)

  position_input = DRIVER.find_element(id: "KeywordSearch")
  position_input.send_keys(position)

  DRIVER.find_element(class: "search")
end

def record_listing_details(filename)
  job_listings = DRIVER.find_elements(class: 'jobListing')
  companies = DRIVER.find_elements(css: 'span.showHH.inline.empName')
  locations = DRIVER.find_elements(css: 'span.small.location')
  titles = DRIVER.find_elements(css: 'span.title')

  job_listings.each.with_index do |listing, i|

    listing.click

    sleep(3)

    DRIVER.find_element(class: 'mfp-close').click if i == 0

    descriptions = DRIVER.find_elements(css: 'div.jobDescriptionContent.desc')
    listing_details_array = [titles[i].text, companies[i].attribute('innerHTML'), locations[i].attribute('innerHTML'), descriptions[i].text, "*********************************"]

    IOStream::append_file(filename, listing_details_array)
  end
end

SUMMARY_FILE = IOStream::create_file

DRIVER.get("https://www.glassdoor.com/index.html")
sleep(3)
search_jobs.click
sleep(1)
record_listing_details(SUMMARY_FILE)
sleep(99999)
result_file.close
