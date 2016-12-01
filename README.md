# Pabang Webcrawler

### Background

Pabang Webcrawler is a web browser automation script for Glassdoor that utilizes the Selenium webdriver.

Created by Humza Baig, Jay Hwang, and Michael Pak.

### Description

The user input keywords that trigger their corresponding action:

[Keyword] Website
- The script takes a keyword [Glassdoor] as an input and formats the keyword using Regex. The modified keyword triggers the webcrawler through Selenium webdriver, which opens the specified website's job listings page.

[Keyword] Search Criteria
- The script takes additional keywords ex. [Software Engineer, Back-end, Front-end, Full Stack], which is parsed with Regex to ensure the keywords meet the website's input format. The webcrawler is triggered displaying all relevant job postings within the website.

[Index] Job Postings List
- The script parse through the results and stores relevant information related to the job posting ex. (Title of Job, Relevant Dates, Location). With the gathered information, the script will numerically display a user-friendly list of all job postings that met the search criteria. Inputting a number will open that particular job listing in the web browser.

### Additional Bonus

Upcoming Websites
- Hired
- LinkedIn

Upcoming Features
- Job Posting Criteria Keywords
The script takes additional keywords [Ruby, Python, Leadership, Teamwork] desired in the job posting.

- Job Posting Filter Keywords
The script takes additional keywords [CEO, Vice-President, No-Salary] NOT desired in the job posting.

### End Result

The Pabang Webcrawler creates a PASS/FAIL summary based upon keywords, results, and desired match percentage.

Summary
  - Job Title, Search Criteria, Filter Criteria
  - Pass/Fail w/ Match Percentage
    * Pass: reasons based upon Search Criteria
    * Fail: reasons based upon Filter Criteria
