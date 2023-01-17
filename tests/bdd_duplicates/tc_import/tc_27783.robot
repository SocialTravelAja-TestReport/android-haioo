*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27783_SETUP}	Get Variable Value	${TEST 27783 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27783_SETUP is not None	${__TEST_27783_SETUP}

Test Teardown
	${__TEST_27783_TEARDOWN}	Get Variable Value	${TEST 27783 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27783_TEARDOWN is not None	${__TEST_27783_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Selecting end Date before start date will modify selection date start and end
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer selecting end date before start date
	Then the end date become start date vice versa

	[Teardown]	Test Teardown