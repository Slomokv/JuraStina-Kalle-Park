*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../Generic-Test-Cases/generic-keywords.robot
Resource    VG_Daniel_major-keywords.robot
Test Setup  Open Browser  ${URL}  ${BROWSER}    options=add_experimental_option("prefs", {"intl.accept_languages": "en-GB"})
Test Teardown    Close Browser


*** Test Cases ***

The user should be able to register with a username that will be unique
    [Tags]    VG_Daniel    Registration
    [Documentation]    Assures that a user cannot choose a username that is already taken.
    Given That an account with the name 'Stina-Kalle' already exists
    When A user tries to register using the same name
    Then The user gets an error saying that the name is already taken


The user has 3 different age groups to choose from when buying a ticket (Adult, Child, Senior)
    [Tags]    VG_Daniel    Ticket_selection
    [Documentation]    Assures that the age groups (ticket types) are present in the ticket type dropdown
    Given That the user is logged in and on the "buy tickets" page
    When The user clicks the dropdown menu "ticket type"
    Then The user should be able to choose between an "Adult", "Child" or "Senior" ticket


The user has 2 different ticket categories to choose from (Regular, VIP)
    [Tags]    VG_Daniel    Ticket_selection
    [Documentation]    Assures that the ticket types "Regular" and "VIP" are present in the ticket categories dropdown
    Given That the user is logged in and on the "buy tickets" page
    When The user clicks the dropdown menu "ticket category"
    Then The user should be able to choose between a "Regular" and a "VIP" ticket


The price of a VIP ticket should be double that of a Regular ticket
    [Tags]    VG_Daniel    Ticket_price
    [Documentation]    Assures that the price of a VIP ticket is twice that of a Regular ticket, as it is supposed to
    Given That the user is logged in and on the "buy tickets" page
    When The user looks at the price of a VIP and Regular ticket
    Then The price of a VIP ticket should be twice that of a Regular ticket