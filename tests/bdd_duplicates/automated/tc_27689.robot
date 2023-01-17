*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource
Resource    ${EXECDIR}/resources/step_definitions/itinerary_step_def.resource

*** Test Cases ***
Display error message for trip name with more than 50 characters
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer enters a trip name with more than "50" characters
	Then an error message should be displayed stating that the trip name must not exceed "50" characters

	[Teardown]	Test Teardown