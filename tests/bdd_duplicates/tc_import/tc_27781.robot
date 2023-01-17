*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27781_SETUP}	Get Variable Value	${TEST 27781 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27781_SETUP is not None	${__TEST_27781_SETUP}

Test Teardown
	${__TEST_27781_TEARDOWN}	Get Variable Value	${TEST 27781 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27781_TEARDOWN is not None	${__TEST_27781_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Display error message for empty trip dates
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When input blank value on "Select Date" modal
	Then Error Message appeared

	[Teardown]	Test Teardown