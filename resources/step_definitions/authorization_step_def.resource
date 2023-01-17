*** Settings ***
Library     AppiumLibrary
Resource    ../pattern/page/login_and_register_page.resource
Resource    ../pattern/tasks/login.robot
Resource    ../pattern/page/itinerary_page.resource
Resource    ../pattern/page/create_new_itinerary_page.resource

*** Keywords ***

the customer is accessing the page as a guest
    Wait Until Element Is Visible       ${REGISTER_BUTTON}
    Swipe    500    500    500    0
    Click Element                       ${ENTER_WITHOUT_LOGIN}

the customer is on Itinerary Page
    Wait Until Element Is Visible       xpath=//android.widget.FrameLayout[@content-desc="Itinerary"]/android.widget.ImageView
    Click Element                       xpath=//android.widget.FrameLayout[@content-desc="Itinerary"]/android.widget.ImageView

Modal "Login Dulu" appear
    Wait Until Element Is Visible       id=design_bottom_sheet
    Click Element                       id=design_bottom_sheet

the customer is logged in as Benson
    ${IS_LOGGED_IN}=    Run Keyword And Return Status    Verify not logged in
    IF    ${IS_LOGGED_IN}
        Login with      influencer01@yopmail.com      P@ssw0rd
    ELSE
        Navigate to Login Page
        Login with    influencer01@yopmail.com    P@ssw0rd
    END

the customer clicks on the add icon to create a new itinerary
    Wait Until Element Is Visible    ${ADD_ITINERARY_BUTTON}
    Click Element    ${ADD_ITINERARY_BUTTON}

the "Create Itinerary Form" page should be opened
    Wait Until Element Is Visible       ${CREATE_ITINERARY_NAMA_TRIP}
    Wait Until Element Is Visible       ${CREATE_ITINERARY_START_LOC}
    Wait Until Element Is Visible       ${CREATE_ITINERARY_DEST_LOC}
    Wait Until Element Is Visible       ${CREATE_ITINERARY_DATE}
    Wait Until Element Is Visible       ${CREATE_ITINERARY_PRIVATE}
    Wait Until Element Is Visible       ${CREATE_ITINERARY_PUBLIC}
    Wait Until Element Is Visible       ${CREATE_ITINERARY_CONFIRM_BUTTON}

the customer click Login dulu button
    Wait Until Element Is Visible       id=btn_dialog_general_continue
    Click Element                       id=btn_dialog_general_continue

the customer should be redirected to the sign up page
    Wait Until Element Is Visible    ${ENTER_WITHOUT_LOGIN}
    Wait Until Element Is Visible    ${GO_TO_LOGIN_PAGE}

the customer is already on the "Create Itinerary Form" page
    the customer is on Itinerary Page
    the customer clicks on the add icon to create a new itinerary
    the "Create Itinerary Form" page should be opened

the customer submits the form without entering a trip name
    Input Text    ${CREATE_ITINERARY_NAMA_TRIP}    ${EMPTY}
    Click Element    ${CREATE_ITINERARY_CONFIRM_BUTTON}
    
an error message should be displayed stating that the trip name field is required
    Text Should Be Visible    Nama Trip belum diisi

user is on login page
    Wait Until Element Is Visible    ${GO_TO_LOGIN_PAGE}
    Click Element                ${GO_TO_LOGIN_PAGE}
    Element Should Be Visible    ${USERNAME_FIELD}
    Element Should Be Visible    ${PASSWORD_FIELD}
    Element Should Be Visible    ${LOGIN_BUTTON}
    
user login with unregistered credentials
    Input Text    ${USERNAME_FIELD}     oafiasfi@mail.com
    Input Text    ${PASSWORD_FIELD}     P@ssw0rd
    
message "User tidak terdaftar"
    Text Should Be Visible    User tidak terdaftar