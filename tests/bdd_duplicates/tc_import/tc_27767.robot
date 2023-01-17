*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_27767_SETUP}	Get Variable Value	${TEST 27767 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_27767_SETUP is not None	${__TEST_27767_SETUP}

Test Teardown
	${__TEST_27767_TEARDOWN}	Get Variable Value	${TEST 27767 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_27767_TEARDOWN is not None	${__TEST_27767_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
Display popular cities in "Select Start City" modal
	[Setup]	Test Setup

	Given the customer is logged in as Benson
	And the customer is on the "Create Itinerary Form" page
	And the customer has opened the "Select Destination City" modal
	When the customer searches for a city
	Then the popular cities (Bandung, Jakarta, Denpasar, Yogyakarta, Malang) should be displayed in the modal

	[Teardown]	Test Teardown