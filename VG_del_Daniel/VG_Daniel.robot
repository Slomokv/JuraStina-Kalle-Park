*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../Generic-Test-Cases/generic-keywords.robot
Resource    VG_Daniel_major-keywords.robot
Test Setup  Open Browser  ${URL}  ${BROWSER}    options=add_experimental_option("prefs", {"intl.accept_languages": "en-GB"})
Test Teardown    Close Browser


*** Test Cases ***

The user registers with a username that will be unique
    [Tags]    VG_Daniel
    [Documentation]    Assures that a user cannot choose a username that is already taken.
    Given That an account with the name 'Stina-Kalle' already exists
    When A user tries to register using the same name
    Then The user gets an error saying that the name is already taken


The user has 3 different choices for tickets depending on age group
    [Tags]    VG_Daniel
    [Documentation]    Assures that the age groups

    Given That the user is logged in and on the "buy tickets" page
    When The user clicks the dropdown menu "ticket type"
    Then The user should be able to choose between an "Adult", "Child" or "Senior" ticket