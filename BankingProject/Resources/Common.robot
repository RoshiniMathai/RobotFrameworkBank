*** Settings ***
Library         SeleniumLibrary


*** Keywords ***
Open Browser And Navigate To Login Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${BANK_MANAGER_LOGIN_BUTTON}

End of Test
    Close Browser