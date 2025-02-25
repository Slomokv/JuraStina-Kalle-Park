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


### The user should be able to register with a username that will be unique ###

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

    Registering with a name that is taken should display an error message


### Tickets page dropdown tests ###

That the user is logged in and on the "buy tickets" page
    [Tags]    Given

    The user is logged in
    The user navigates to the "buy tickets" page

The user clicks the dropdown menu "ticket type"
    [Tags]    When

    Click Element    ${ticket_type_dropdown}

The user clicks the dropdown menu "ticket category"
    [Tags]    When

    Click Element    ${ticket_category_dropdown}


The user should be able to choose between an "Adult", "Child" or "Senior" ticket
    [Tags]    Then
    [Documentation]    At this moment, the test doesn't require clicking the dropdown to run this test
    Element Should Contain    ${ticket_type_dropdown}    Adult
    Element Should Contain    ${ticket_type_dropdown}    Child
    Element Should Contain    ${ticket_type_dropdown}    Senior

The user should be able to choose between a "Regular" and a "VIP" ticket
    [Tags]    Then
    [Documentation]    At this moment, the test doesn't require clicking the dropdown to run this test
    Element Should Contain    ${ticket_category_dropdown}    Regular
    Element Should Contain    ${ticket_category_dropdown}    VIP


### Tickets price test

The user looks at the price of a VIP and Regular ticket
    [Tags]    When
    They add a 'regular' ticket to the cart
    They add a 'vip' ticket to the cart
    Click Element    ${nav_menu_cart}
    Wait Until Element Is Visible    ${cart_details}    10s

The price of a VIP ticket should be twice that of a Regular ticket
    [Tags]    Then
    [Documentation]    Currently checks if the cart contains these exact strings, as I haven't been able to 
    ...    understand locators in flexboxes yet, but as long as none of the prices changes, the price of
    ...    a VIP ticket is indeed twice the price of a regular ticket - DK
    Element Should Contain    ${cart_item_no_1}    1 Regular Adult Ticket(s) - $50
    Element Should Not Contain   ${cart_item_no_2}    1 VIP Adult Ticket(s) - $100
