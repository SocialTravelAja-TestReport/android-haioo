*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/helpers/initial_setup.resource
Resource    ${EXECDIR}/resources/step_definitions/authorization_step_def.resource

*** Test Cases ***
User login with unregistered credential
    [Setup]     Test Setup

    Given user is on login page
    When user login with unregistered credentials
    Then message "User tidak terdaftar"

    [Teardown]  Test Teardown