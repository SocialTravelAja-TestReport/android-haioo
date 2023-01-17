*** Settings ***
Documentation   Check wheter user already login or not
Library     AppiumLibrary
Resource    ../resources/pattern/page/login_and_register_page.resource

*** Keywords ***
Check if user already login
    ${IS_ELEMENT_VISIBLE}=  Run Keyword And Return Status    Element Should Be Visible    ${ENTER_WITHOUT_LOGIN}

    Run Keyword If    ${IS_ELEMENT_VISIBLE}    Login