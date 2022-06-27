*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate UnSuccesful Login

*** Variables ***
${Error_Message_Login}      css:.alert-danger


*** Test Cases ***          username        password         #parametrized
Invalid username            dsahed          learning
Invalid password            rahulshetty     ploudfg
special characters          @#$             learning


*** Keywords ***
Validate UnSuccesful Login
    [Arguments]     ${username}     ${password}
    open the browser with the Mortgage payment url
    Fill the login Form     ${username}     ${password}
    wait untill it checks and display error message
    verify error message is correct

open the browser with the Mortgage payment url
    Create Webdriver    Chrome      executable_path=/Users/akash/Downloads/chromedriver
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    [Arguments]     ${username}     ${password}
    Input Text    id:username   ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

wait untill it checks and display error message
    Wait Until Element Is Visible   ${Error_Message_Login}

verify error message is correct
    ${result}=  Get Text    ${Error_Message_Login}
    Should Be Equal As Strings    ${result}    Incorrect username/password.

