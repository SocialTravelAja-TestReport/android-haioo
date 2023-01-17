*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource
Resource    ${EXECDIR}/resources/step_definitions/itinerary_step_def.resource


*** Test Cases ***
Do not enable text suggestion/auto complete for start location if less than 3 letters are entered
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer entered fewer than "3" letters in the Start Location field
	Then text suggestions/auto complete should not be enabled

	[Teardown]	Test Teardown