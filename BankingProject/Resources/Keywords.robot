*** Keywords ***
Click Bank Manager Login
    [Documentation]    Clicks the Bank Manager Login button.
    Click Element    ${BANK_MANAGER_LOGIN_BUTTON}

Verify Bank Manager Login Page
    [Documentation]    Verifies the Bank Manager page is loaded.
    Wait Until Page Contains Element    ${ADD_CUSTOMER_BUTTON}
    Element Should Be Visible           ${ADD_CUSTOMER_BUTTON}

Click Customer Login
    [Documentation]    Clicks the Customer Login button.
    Click Element    ${CUSTOMER_LOGIN_BUTTON}

Verify Customer Login Page
    [Documentation]    Verifies the Customer Login page is loaded.
    Wait Until Page Contains Element    ${CUSTOMER_NAME_DROPDOWN}
    Element Should Be Visible           ${CUSTOMER_NAME_DROPDOWN}

Add Customer
    [Arguments]    ${first_name}    ${last_name}    ${post_code}
    Wait Until Page Contains Element    ${ADD_CUSTOMER_BUTTON}
    Click Element    ${ADD_CUSTOMER_BUTTON}
    Wait Until Page Contains Element    ${FIRST_NAME_INPUT}
    Input Text       ${FIRST_NAME_INPUT}    ${first_name}
    Input Text       ${LAST_NAME_INPUT}     ${last_name}
    Input Text       ${POST_CODE_INPUT}     ${post_code}
    Click Element    ${SUBMIT_CUSTOMER_BUTTON}
    Handle Alert     ACCEPT

Verify Customer Added Successfully
    [Documentation]    Ensure no errors are displayed after adding a customer.
    Wait Until Page Contains Element    ${ADD_CUSTOMER_BUTTON}

Open Account
    [Arguments]    ${customer_name}    ${currency}
    Wait Until Page Contains Element    ${OPEN_ACCOUNT_BUTTON}
    Click Element    ${OPEN_ACCOUNT_BUTTON}
    Wait Until Page Contains Element    ${CUSTOMER_DROPDOWN}
    Select From List By Label    ${CUSTOMER_DROPDOWN}    ${customer_name}
    Select From List By Label    ${CURRENCY_DROPDOWN}    ${currency}
    Click Element    ${PROCESS_ACCOUNT_BUTTON}
    Handle Alert     ACCEPT

Verify Account Created Successfully
    [Documentation]    Ensure account creation was successful.
    Wait Until Page Contains Element    ${OPEN_ACCOUNT_BUTTON}

Select Customer
    [Arguments]    ${customer_name}
    Wait Until Page Contains Element    ${CUSTOMER_NAME_DROPDOWN}
    Select From List By Label    ${CUSTOMER_NAME_DROPDOWN}    ${customer_name}
    Click Element    ${LOGIN_BUTTON}

Perform Deposit
    [Arguments]    ${amount}
    Wait Until Page Contains Element    ${DEPOSIT_BUTTON}
    Click Element    ${DEPOSIT_BUTTON}
    Wait Until Page Contains Element    ${DEPOSIT_INPUT}
    Input Text       ${DEPOSIT_INPUT}    ${amount}
    Click Element    ${DEPOSIT_SUBMIT_BUTTON}

Perform Withdrawal
    [Arguments]    ${amount}
    Wait Until Page Contains Element    ${WITHDRAWAL_BUTTON}
    Click Element    ${WITHDRAWAL_BUTTON}
    Wait Until Page Contains Element    ${WITHDRAW_INPUT}
    Input Text       ${WITHDRAW_INPUT}    ${amount}
    Click Element    ${WITHDRAW_SUBMIT_BUTTON}

Verify Transaction
    [Arguments]    ${amount}
    Wait Until Page Contains Element    ${TRANSACTION_SUCCESS_MESSAGE}
    Element Should Contain    ${TRANSACTION_SUCCESS_MESSAGE}    ${amount}
    
View Transactions
    [Documentation]    Clicks the Transactions button to view transaction history.
    Wait Until Page Contains Element    ${TRANSACTION_BUTTON}
    Click Element    ${TRANSACTION_BUTTON}

Verify Transactions Are Visible
    [Documentation]    Verify the transaction table is visible and contains rows.
    Wait Until Page Contains Element    ${TRANSACTION_TABLE}
    ${rows}=    Get Element Count    ${TRANSACTION_TABLE}
    Should Be True    ${rows} > 1

Reset Transactions
    [Documentation]    Resets the transaction table to its initial state.
    Click Element    ${RESET_BUTTON}

Verify Transactions Are Cleared
    [Documentation]    Verify the transaction table is cleared after reset.
    Wait Until Page Contains Element    ${TRANSACTION_TABLE}
    ${rows}=    Get Element Count    ${TRANSACTION_TABLE}
    Should Be Equal As Numbers    ${rows}    1

Logout Customer
    [Documentation]    Logs out the currently logged-in customer.
    Click Element    ${LOGOUT_BUTTON}

Verify Customer Logout
    [Documentation]    Verify the customer is logged out successfully.
    Wait Until Page Contains Element    ${CUSTOMER_NAME_DROPDOWN}
    Element Should Be Visible           ${CUSTOMER_NAME_DROPDOWN}

Attempt Invalid Customer Login
    [Documentation]    Attempts login with an invalid customer name.
    Wait Until Page Contains Element    ${CUSTOMER_NAME_DROPDOWN}
    Select From List By Index    ${CUSTOMER_NAME_DROPDOWN}    0
    Click Element                ${LOGIN_BUTTON}

Verify Login Failed
    [Documentation]    Verifies that login attempt failed due to invalid customer.
    Element Text Should Contain    ${ERROR_MESSAGE}    Your Name must be valid

Attempt Withdrawal
    [Arguments]    ${amount}
    Wait Until Page Contains Element    ${WITHDRAWAL_BUTTON}
    Click Element    ${WITHDRAWAL_BUTTON}
    Wait Until Element Is Not Visible    ${TRANSACTION_SUCCESS_MESSAGE}
    Wait Until Page Contains Element    ${WITHDRAW_INPUT}
    Input Text       ${WITHDRAW_INPUT}    ${amount}
    Click Element    ${WITHDRAW_SUBMIT_BUTTON}

Verify Transaction Failed
    [Documentation]    Verifies withdrawal fails due to insufficient balance.
    Element Should Contain    ${TRANSACTION_SUCCESS_MESSAGE}    Transaction Failed

Verify Transaction Sorting
    [Documentation]    Verifies transactions are sorted in descending order.
    ${rows}=    Get WebElements    ${TRANSACTION_TABLE_ROWS}
    ${amounts}=    Create List
    FOR    ${row}    IN    @{rows}
        ${amount}=    Get Text    ${row}//td[2]
        Append To List    ${amounts}    ${amount}
    END
    Should Be True    ${amounts} == Sort List ${amounts} reverse=True

Filter Transactions By Type
    [Arguments]    ${type}
    [Documentation]    Filters transactions by the specified type (Credit/Debit).
    Input Text       ${FILTER_INPUT}    ${type}

Verify Filtered Transactions
    [Arguments]    ${type}
    [Documentation]    Verifies transactions are filtered by the specified type.
    ${rows}=    Get WebElements    ${TRANSACTION_TABLE_ROWS}
    FOR    ${row}    IN    @{rows}
        ${text}=    Get Text    ${row}//td[3]
        Should Be Equal    ${text}    ${type}
    END