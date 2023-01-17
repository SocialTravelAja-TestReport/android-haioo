*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27769_SETUP}	Get Variable Value	${TEST 27769 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27769_SETUP is not None	${__TEST_27769_SETUP}

Test Teardown
	${__TEST_27769_TEARDOWN}	Get Variable Value	${TEST 27769 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27769_TEARDOWN is not None	${__TEST_27769_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Do not enable text suggestion/auto complete for start location if less than 3 letters are entered
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the "Error city not found" modal should not be displayed
	When the customer entered fewer than "3" letters in the Destination Location field
	Then text suggestions/auto complete should not be enabled

	[Teardown]	Test Teardown