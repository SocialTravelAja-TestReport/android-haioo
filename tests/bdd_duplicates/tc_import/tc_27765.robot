*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27765_SETUP}	Get Variable Value	${TEST 27765 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27765_SETUP is not None	${__TEST_27765_SETUP}

Test Teardown
	${__TEST_27765_TEARDOWN}	Get Variable Value	${TEST 27765 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27765_TEARDOWN is not None	${__TEST_27765_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Display "Error city not found" modal if no results are found
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer the customer is on the "Create Itinerary Form" page
	When the customer entered a destination location that does not match any cities or regencies
	Then the "Error city not found" modal should be displayed

	[Teardown]	Test Teardown