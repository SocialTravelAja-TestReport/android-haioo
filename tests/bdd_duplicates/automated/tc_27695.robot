*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource
Resource    ${EXECDIR}/resources/step_definitions/itinerary_step_def.resource

*** Test Cases ***
Display error message for empty start location
	[Setup]	    Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer submits the form without entering a start location
	Then an error message should be displayed stating that the start location field is required

	[Teardown]	    Test Teardown