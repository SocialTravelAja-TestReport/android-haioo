*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27771_SETUP}	Get Variable Value	${TEST 27771 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27771_SETUP is not None	${__TEST_27771_SETUP}

Test Teardown
	${__TEST_27771_TEARDOWN}	Get Variable Value	${TEST 27771 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27771_TEARDOWN is not None	${__TEST_27771_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Open "Select Start City" modal on click
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer clicks on the Desstination Location field
	Then the "Select Destination City" modal should be opened

	[Teardown]	Test Teardown