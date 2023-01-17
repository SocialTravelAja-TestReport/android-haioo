*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource
Resource    ${EXECDIR}/resources/step_definitions/itinerary_step_def.resource

*** Test Cases ***
Enable text suggestion/auto complete for start location
	[Setup]	    Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer searches for a city
	And the customer has entered at least "3" letters in the Start Location field
	Then text suggestions/auto complete should be enabled

	[Teardown]	    Test Teardown