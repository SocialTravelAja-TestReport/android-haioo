*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource

*** Test Cases ***
Redirect to sign up page for guest customer when clicking on add icon
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on Itinerary Page
	When the customer clicks on the add icon to create a new itinerary
	Then the "Create Itinerary Form" page should be opened

	[Teardown]	Test Teardown