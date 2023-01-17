*** Settings ***
Library     AppiumLibrary

*** Variables ***
#Register Page
${ENTER_WITHOUT_LOGIN}      id=tv_skip_to_main
${GO_TO_LOGIN_PAGE}         id=tv_login
${REGISTER_BUTTON}          id=btn_register

#Login Page
${USERNAME_FIELD}           id=et_email_phone
${PASSWORD_FIELD}           id=et_password
${LOGIN_BUTTON}             id=btn_login
