*** Settings ***
Library         SeleniumLibrary
Variables        ../config.py

*** Keywords ***
Open Browser And Navigate To Login Page
    # Configure custom Chrome options to handle headless Execution flawlessly inside CI/CD
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    # We dynamically pass the browser options only if running a headless chrome context
    Run Keyword If    'headlesschrome' in '${BROWSER}'    Call Method    ${options}    add_argument    --headless=new
    Run Keyword If    'headlesschrome' in '${BROWSER}'    Call Method    ${options}    add_argument    --no-sandbox
    Run Keyword If    'headlesschrome' in '${BROWSER}'    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Run Keyword If    'headlesschrome' in '${BROWSER}'    Call Method    ${options}    add_argument    --window-size\=1920,1080
    
    Create Webdriver    Chrome    options=${options}
    # ${URL} is extracted automatically from your config.py file
    Go To    ${URL}
    #Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${BANK_MANAGER_LOGIN_BUTTON}

End of Test
    Close Browser
