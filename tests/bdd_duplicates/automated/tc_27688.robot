*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource

*** Test Cases ***
Display error message for empty trip name
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is already on the "Create Itinerary Form" page
	When the customer submits the form without entering a trip name
	Then an error message should be displayed stating that the trip name field is required

	[Teardown]	Test Teardown