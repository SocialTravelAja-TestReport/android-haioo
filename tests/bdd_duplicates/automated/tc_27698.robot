*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource
Resource    ${EXECDIR}/resources/step_definitions/itinerary_step_def.resource

*** Test Cases ***
Display popular cities in "Select Start City" modal
	[Setup]	    Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	And the customer has opened the "Select Start City" modal
	When the "Select Start City" modal appeared
	Then the popular cities (Mandalika, Magelang, Denpasar, Likupang, Danau Toba, Labuan Bajo) should be displayed in the modal

	[Teardown]	    Test Teardown