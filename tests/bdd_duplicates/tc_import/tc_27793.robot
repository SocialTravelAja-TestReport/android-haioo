*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27793_SETUP}	Get Variable Value	${TEST 27793 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27793_SETUP is not None	${__TEST_27793_SETUP}

Test Teardown
	${__TEST_27793_TEARDOWN}	Get Variable Value	${TEST 27793 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27793_TEARDOWN is not None	${__TEST_27793_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Display error message for city not found in "Select End City" modal
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page and has opened the "Select Start City" modal
	When the customer enters a city name that is not in the database
	Then an error message should be displayed stating that the city was not found

	[Teardown]	Test Teardown