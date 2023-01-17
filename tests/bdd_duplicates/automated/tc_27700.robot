*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource
Resource    ${EXECDIR}/resources/step_definitions/itinerary_step_def.resource

*** Test Cases ***
Display "Error city not found" modal if no results are found
	[Setup]	    Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer entered a start location that does not match any cities or regencies
	Then the "Error city not found" modal should be displayed

	[Teardown]	    Test Teardown