*** Settings ****
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource

*** Test Cases ***
Open "Create Itinerary Form" page for logged in customer when clicking on add icon
	[Setup]     Test Setup

    Given the customer is accessing the page as a guest
    And the customer is on Itinerary Page
    When the customer clicks on the add icon to create a new itinerary
    Then Modal "Login Dulu" appear

    [Teardown]      Test Teardown


