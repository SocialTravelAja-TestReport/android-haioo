*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27766_SETUP}	Get Variable Value	${TEST 27766 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27766_SETUP is not None	${__TEST_27766_SETUP}

Test Teardown
	${__TEST_27766_TEARDOWN}	Get Variable Value	${TEST 27766 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27766_TEARDOWN is not None	${__TEST_27766_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Display error message for empty start location
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer submits the form without entering a destination location
	Then an error message should be displayed stating that the destination location field is required

	[Teardown]	Test Teardown