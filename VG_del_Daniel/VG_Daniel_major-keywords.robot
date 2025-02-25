*** Settings ***

Library    SeleniumLibrary
Resource    VG_Daniel_minor-keywords.robot

*** Comments ***

    Trying out having the gherkin-syntax keywords in one file 'major-keywords', while
    having keywords of (or close to) component level in 'minor-keywords'

    For the sake of making files more readable.
    Ctrl + left click a keyword (with the right robot framework extension..?) to jump to the implementation
    of that keyword for simpler navigation - DK

*** Keywords ***


### User registers with a username that will be unique ###

That an account with the name '${TEST_USERNAME}' already exists
    [Tags]    Given
    [Documentation]    Sets a TEST_USERNAME for the scope of the test this is called for

    Set Test Variable    ${TEST_USERNAME}    ${TEST_USERNAME}
    User has a registered account with a specified name
    They should be redirected to the login page
    


A user tries to register using the same name
    [Tags]    When
    [Documentation]    The user tries to register with the same TEST_USERNAME as in the Given step

    They attempt to register with a specified name


The user gets an error saying that the name is already taken
    [Tags]    Then
    [Documentation]
    Registering with a name that is taken should display an error message


