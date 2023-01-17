*** Settings ***
Library     AppiumLibrary
Resource    ${EXECDIR}/resources/pattern/page/login_and_register_page.resource
Resource    ${EXECDIR}/resources/pattern/page/homepage.resource

*** Keywords ***
Verify not logged in
#TODO edit element
    Page Should Contain Element    ${REGISTER_BUTTON}

Verify on Login Page
    Element Should Be Visible    ${LOGIN_BUTTON}

Navigate to Login Page
    Click Text    Log in aja!
    Wait Until Element Is Visible    ${USERNAME_FIELD}

Login with
    [Arguments]     ${USERNAME}             ${PASSWORD}
    Input Text      ${USERNAME_FIELD}       ${USERNAME}
    Input Text      ${PASSWORD_FIELD}       ${PASSWORD}
    Click Element    ${LOGIN_BUTTON}