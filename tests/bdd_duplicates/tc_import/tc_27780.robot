*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27780_SETUP}	Get Variable Value	${TEST 27780 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27780_SETUP is not None	${__TEST_27780_SETUP}

Test Teardown
	${__TEST_27780_TEARDOWN}	Get Variable Value	${TEST 27780 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27780_TEARDOWN is not None	${__TEST_27780_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Allow selected start date before end date
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer select start date before end date
	Then itinerary created

	[Teardown]	Test Teardown