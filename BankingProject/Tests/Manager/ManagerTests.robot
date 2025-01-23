*** Settings ***
Documentation   Test Suite for GlobalSQA Banking Project
Library         SeleniumLibrary
Resource        ../../Pages/Login.po.robot
Resource        ../../Resources/Common.robot
Resource        ../../Resources/Keywords.robot
Test Teardown       End of Test

*** Variables ***
${BROWSER}      chrome
${BASE_URL}     https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login

*** Test Cases ***
Test Bank Manager Login
    [Documentation]    Verify that the Bank Manager Login button works correctly.
    [Tags]          Login
    ##[Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Bank Manager Login
    Verify Bank Manager Login Page

Test Add Customer
    [Documentation]    Verify that adding a new customer works correctly.
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Bank Manager Login
    Add Customer    John    Doe    12345
    Verify Customer Added Successfully

Test Open Account
    [Documentation]    Verify that opening an account for a customer works correctly.
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Bank Manager Login
    Add Customer    Jane    Smith    67890
    Open Account    Jane Smith    Dollar
    Verify Account Created Successfully

Test Account Creation With Different Currencies
    [Documentation]    Verify account creation with different currencies.
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Bank Manager Login
    Add Customer    Alice    Wonderland    54321
    Open Account    Alice Wonderland    Pound
    Verify Account Created Successfully
    Open Account    Alice Wonderland    Rupee
    Verify Account Created Successfully