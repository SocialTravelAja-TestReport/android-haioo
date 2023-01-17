*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27764_SETUP}	Get Variable Value	${TEST 27764 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27764_SETUP is not None	${__TEST_27764_SETUP}

Test Teardown
	${__TEST_27764_TEARDOWN}	Get Variable Value	${TEST 27764 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27764_TEARDOWN is not None	${__TEST_27764_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Accept alphanumeric and special character input for destination location
	[Setup]	    Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer submits the form without entering a destination location
	Then an error message should be displayed stating that the destination location field is required

	[Teardown]	    Test Teardown