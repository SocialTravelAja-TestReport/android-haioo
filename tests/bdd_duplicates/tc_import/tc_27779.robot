*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27779_SETUP}	Get Variable Value	${TEST 27779 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27779_SETUP is not None	${__TEST_27779_SETUP}

Test Teardown
	${__TEST_27779_TEARDOWN}	Get Variable Value	${TEST 27779 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27779_TEARDOWN is not None	${__TEST_27779_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Backdate not allowed
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer clicks on the Trip Dates field
	Then backdated is not selectable

	[Teardown]	Test Teardown