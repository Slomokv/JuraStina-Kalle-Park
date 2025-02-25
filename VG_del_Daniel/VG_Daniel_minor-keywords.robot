*** Settings ***

Library    SeleniumLibrary
Resource    ../Generic-Test-Cases/generic-keywords.robot
Variables    VG_Daniel-variables.py




*** Comments ***

    Trying out having the gherkin-syntax keywords in one file 'major-keywords', while
    having keywords of (or close to) component level in 'minor-keywords'

    For the sake of making files more readable.
    Ctrl + left click a keyword (with the right robot framework extension..?) to jump to the implementation 
    of that keyword for simpler navigation - DK

*** Keywords ***


User has a registered account with a specified name
    [Tags]    VG_minor
    They attempt to register with a specified name


They attempt to register with a specified name
    [Tags]    VG_minor
    Click Element    ${nav_menu_register}
    Input Text    ${USERNAME_FIELD}    ${TEST_USERNAME}
    Input Text    ${PASSWORD_FIELD}    'stinakalle12'
    Click Element    ${SUBMIT_REGISTER}

Registering with a name that is taken should display an error message
    [Tags]    VG_minor
    Wait Until Element Contains    ${register_message}    ${register_error_message}