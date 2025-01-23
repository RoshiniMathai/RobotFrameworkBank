*** Variables ***
${BANK_MANAGER_LOGIN_BUTTON}     xpath=//button[contains(text(), 'Bank Manager Login')]
${CUSTOMER_LOGIN_BUTTON}         xpath=//button[contains(text(), 'Customer Login')]
${ADD_CUSTOMER_BUTTON}           xpath=//button[contains(text(), 'Add Customer')]
${CUSTOMER_NAME_DROPDOWN}        id=userSelect
${LOGIN_BUTTON}                  xpath=//button[text()='Login']
${LOGOUT_BUTTON}                 xpath=//button[text()='Logout']
${FIRST_NAME_INPUT}              xpath=//input[@placeholder='First Name']
${LAST_NAME_INPUT}               xpath=//input[@placeholder='Last Name']
${POST_CODE_INPUT}               xpath=//input[@placeholder='Post Code']
${SUBMIT_CUSTOMER_BUTTON}        xpath=//button[text()='Add Customer']
${OPEN_ACCOUNT_BUTTON}           xpath=//button[contains(text(), 'Open Account')]
${CUSTOMER_DROPDOWN}             id=userSelect
${CURRENCY_DROPDOWN}             id=currency
${PROCESS_ACCOUNT_BUTTON}        xpath=//button[text()='Process']
${DEPOSIT_BUTTON}                xpath=//button[contains(text(),'Deposit')]
${WITHDRAWAL_BUTTON}             xpath=//button[contains(text(),'Withdrawl')]
${TRANSACTION_BUTTON}            xpath=//button[contains(text(),'Transactions')]
${DEPOSIT_INPUT}                 xpath=//input[@placeholder='amount']
${WITHDRAW_INPUT}                xpath=//input[@placeholder='amount']
${DEPOSIT_SUBMIT_BUTTON}         xpath=//button[text()='Deposit']
${WITHDRAW_SUBMIT_BUTTON}        xpath=//button[text()='Withdraw']
${TRANSACTION_SUCCESS_MESSAGE}   xpath=//span[contains(@class, 'error')]
${TRANSACTION_TABLE}              xpath=//table[contains(@class, 'table')]//tr
${RESET_BUTTON}                   xpath=//button[text()='Reset']
${LOGOUT_BUTTON}                  xpath=//button[text()='Logout']
${ERROR_MESSAGE}                  xpath=//span[contains(@class, 'error')]
${FILTER_INPUT}                   xpath=//input[@placeholder='Search Transactions']
${TRANSACTION_TABLE_HEADERS}      xpath=//table[contains(@class, 'table')]/thead/tr/th
${TRANSACTION_TABLE_ROWS}         xpath=//table[contains(@class, 'table')]/tbody/tr

