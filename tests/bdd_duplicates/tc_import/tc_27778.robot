*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27778_SETUP}	Get Variable Value	${TEST 27778 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27778_SETUP is not None	${__TEST_27778_SETUP}

Test Teardown
	${__TEST_27778_TEARDOWN}	Get Variable Value	${TEST 27778 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27778_TEARDOWN is not None	${__TEST_27778_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Open "Select Date" modal on click
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer clicks on the Trip Dates field
	Then the "Select Date" modal should be opened

	[Teardown]	Test Teardown