*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Library    String
Library    Collections
Test Setup     open the browser with the Mortgage payment url
Test Teardown  Close Browser session
Resource        resource.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger


*** Test Cases ***
Validate Child window Functionality
    Select the link of Child window
    Verify the user is Switched to Child window
    Grab the Email id in the Child Window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child window
    Click Element    css:.blinkingText
    Sleep    5

Verify the user is Switched to Child window
    Switch Window   NEW
    Element Text Should Be    css:h2    DOCUMENTS REQUEST

Grab the Email id in the Child Window
    ${text} =   Get Text    css:.red
    @{words} =  Split String    ${text}     at
    ${text_split} =     Get From List       ${words}    1
    log     ${text_split}
    @{words_2} =    Split String    ${text_split}
    ${email} =      Get From List    ${words_2}     0
    Set Global Variable    ${email}

Switch to Parent window and enter the Email
    Switch Window   MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username       ${email}