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
Test Customer Login Navigation
    [Documentation]    Verify that the Customer Login button works correctly.
    [Tags]          Login
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Customer Login
    Verify Customer Login Page

Test Customer Logout
    [Documentation]    Verify that a customer can log out successfully.
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Customer Login
    Select Customer    Hermoine Granger
    Perform Deposit    1000
    Logout Customer
    Verify Customer Logout

Test Customer Login And Deposit
    [Documentation]    Verify customer login and transactions (deposit and withdrawal).
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Customer Login
    Select Customer    Hermoine Granger
    Perform Deposit    1000
    Verify Transaction    Deposit Successful

Test Customer Login And Withdraw
    [Documentation]    Verify customer login and transactions (deposit and withdrawal).
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Customer Login
    Select Customer    Hermoine Granger
    Perform Withdrawal    500
    Verify Transaction    Transaction successful

Test View And Reset Transactions
    [Documentation]    Verify that a customer can view and reset transactions.
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Customer Login
    Select Customer    Hermoine Granger
    View Transactions
    Verify Transactions Are Visible
    Reset Transactions
    Verify Transactions Are Cleared

Test Invalid Customer Login
    [Documentation]    Verify login attempt with invalid customer fails.
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Customer Login
    Attempt Invalid Customer Login
    Verify Login Failed

Test Insufficient Balance Withdrawal
    [Documentation]    Verify withdrawal fails if balance is insufficient.
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Customer Login
    Select Customer    Harry Potter
    Perform Deposit    100
    Attempt Withdrawal    200
    Verify Transaction Failed

Test Sorting And Filtering In Transaction Table
    [Documentation]    Verify sorting and filtering in transaction table works correctly.
    [Teardown]    Close Browser
    Open Browser And Navigate To Login Page
    Click Customer Login
    Select Customer    Hermoine Granger
    Perform Deposit    1000
    Perform Withdrawal    500
    View Transactions
    Verify Transaction Sorting
    Filter Transactions By Type    Credit
    Verify Filtered Transactions    Credit

