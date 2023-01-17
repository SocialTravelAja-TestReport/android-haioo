*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27791_SETUP}	Get Variable Value	${TEST 27791 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27791_SETUP is not None	${__TEST_27791_SETUP}

Test Teardown
	${__TEST_27791_TEARDOWN}	Get Variable Value	${TEST 27791 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27791_TEARDOWN is not None	${__TEST_27791_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Successfully submit form with all required fields filled out
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	When the customer fills out all required fields and clicks on the submit button
	Then the form should be successfully submitted and the customer should be redirected to the "My Plan Timeline" page

	[Teardown]	Test Teardown