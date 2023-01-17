*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27770_SETUP}	Get Variable Value	${TEST 27770 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27770_SETUP is not None	${__TEST_27770_SETUP}

Test Teardown
	${__TEST_27770_TEARDOWN}	Get Variable Value	${TEST 27770 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27770_TEARDOWN is not None	${__TEST_27770_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Enable text suggestion/auto complete for start location
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer searches for a city
	And the customer has entered at least "3" letters in the Destination Location field
	Then text suggestions/auto complete should be enabled
	And maximum of "6" suggestions should be displayed

	[Teardown]	Test Teardown