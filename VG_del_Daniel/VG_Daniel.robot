*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../Generic-Test-Cases/generic-keywords.robot
Resource    VG_Daniel_major-keywords.robot



*** Test Cases ***

User registers with a username that will be unique
    [Tags]    VG_Daniel
    [Documentation]    Assures that a user cannot choose a username that is already taken.
    Given That an account with the name 'Stina-Kalle' already exists
    When A user tries to register using the same name
    Then The user gets an error saying that the name is already taken