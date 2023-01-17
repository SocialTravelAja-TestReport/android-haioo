*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27790_SETUP}	Get Variable Value	${TEST 27790 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27790_SETUP is not None	${__TEST_27790_SETUP}

Test Teardown
	${__TEST_27790_TEARDOWN}	Get Variable Value	${TEST 27790 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27790_TEARDOWN is not None	${__TEST_27790_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Display error message for empty required fields
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer clicks on the submit button without filling out any required fields
	Then error messages should be displayed for each required field that has not been filled out

	[Teardown]	Test Teardown