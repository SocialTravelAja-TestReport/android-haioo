*** Settings ***
Library     AppiumLibrary
Resource	${EXECDIR}/resources/step_definitions/authorization_step_def.resource
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource

*** Test Cases ***
Open "Create Itinerary Form" page for logged in customer when clicking on add icon
	[Setup]	Test Setup

	Given the customer is accessing the page as a guest
	And the customer is on Itinerary Page
	And the customer clicks on the add icon to create a new itinerary
	And Modal "Login Dulu" appear
	When the customer click Login dulu button
	And the customer should be redirected to the sign up page

	[Teardown]	Test Teardown