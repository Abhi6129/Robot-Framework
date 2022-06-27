*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The system specific keywords created here from our own
...             domain specific language. they utilize keywords provided
...             by the imported SeleniumLibrary.
Library         SeleniumLibrary
Library         OperatingSystem



*** Variables ***
${username}             rahulshettyacademy
${invalid_password}     123445
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome      executable_path=/Users/akash/Downloads/chromedriver
    Go To   ${url}

Close Browser session
    Close Browser