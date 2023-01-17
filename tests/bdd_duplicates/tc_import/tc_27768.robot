*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27768_SETUP}	Get Variable Value	${TEST 27768 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27768_SETUP is not None	${__TEST_27768_SETUP}

Test Teardown
	${__TEST_27768_TEARDOWN}	Get Variable Value	${TEST 27768 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27768_TEARDOWN is not None	${__TEST_27768_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Do not display "Error city not found" modal if the start location
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer enter invalid city to Destination City Field
	Then the "Error city not found" modal should not be displayed

	[Teardown]	Test Teardown