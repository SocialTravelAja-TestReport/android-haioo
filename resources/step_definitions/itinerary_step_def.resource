*** Settings ***
Library     AppiumLibrary
Resource    ../pattern/page/create_new_itinerary_page.resource

*** Keywords ***
the customer enters a trip name with more than "50" characters
    Input Text          ${CREATE_ITINERARY_NAMA_TRIP}     NoFgJfrIjlHL8IXPpwGx4hu5k4kBhYnINYmTvqqA5VT6YuETqfN
    Click Element       ${CREATE_ITINERARY_CONFIRM_BUTTON}

an error message should be displayed stating that the trip name must not exceed "50" characters
    Text Should Be Visible    Masukkan maksimal 50 karakter

the customer enters a trip name that contains alphanumeric and special characters
    Input Text          ${CREATE_ITINERARY_NAMA_TRIP}    Sp3ci@l Tr1p
    Click Element       ${CREATE_ITINERARY_CONFIRM_BUTTON}

the form should be successfully submitted
    Text Should Be Visible    Sp3ci@l Tr1p

the customer is on the "Create Itinerary Form" page
    Wait Until Element Is Visible       xpath=//android.widget.FrameLayout[@content-desc="Itinerary"]/android.widget.ImageView
    Click Element                       xpath=//android.widget.FrameLayout[@content-desc="Itinerary"]/android.widget.ImageView
    Wait Until Element Is Visible       ${ADD_ITINERARY_BUTTON}
    Click Element                       ${ADD_ITINERARY_BUTTON}

the customer clicks on the Start Location field
    Wait Until Element Is Visible       ${CREATE_ITINERARY_START_LOC}
    Click Element                       ${CREATE_ITINERARY_START_LOC}

the "Select Start City" modal should be opened
    Wait Until Element Is Visible       ${SELECT_START_CITY_MODAL}
    Element Should Be Visible           ${SELECT_START_CITY_MODAL}

the customer submits the form without entering a start location
    Wait Until Element Is Visible       ${CREATE_ITINERARY_CONFIRM_BUTTON}
    Click Element                       ${CREATE_ITINERARY_CONFIRM_BUTTON}

an error message should be displayed stating that the start location field is required
    Text Should Be Visible              Lokasi tujuan belum diisi

the customer has opened the "Select Start City" modal
    the customer clicks on the Start Location field

the "Select Start City" modal appeared
    the "Select Start City" modal should be opened

the popular cities (Mandalika, Magelang, Denpasar, Likupang, Danau Toba, Labuan Bajo) should be displayed in the modal
    Text Should Be Visible    Mandalika
    Text Should Be Visible    Magelang
    Text Should Be Visible    Denpasar
    Text Should Be Visible    Likupang
    Text Should Be Visible    Danau Toba
    Text Should Be Visible    Labuan Bajo
    
the customer searches for a city
    the customer clicks on the Start Location field
    
the customer has entered at least "3" letters in the Start Location field
    Wait Until Element Is Visible    ${CARI_KOTA_KEBERANGKATAN}
    Input Text      ${CARI_KOTA_KEBERANGKATAN}    JAK

text suggestions/auto complete should be enabled
    Text Should Be Visible    JAK
    Element Should Contain Text    ${SUGGESTED_CITY_LIST}    Jakarta

the customer entered a start location that does not match any cities or regencies
    the customer clicks on the Start Location field
    Wait Until Element Is Visible    ${CARI_KOTA_KEBERANGKATAN}
    Input Text      ${CARI_KOTA_KEBERANGKATAN}    invalid_city

the "Error city not found" modal should be displayed
    Sleep    2
    Text Should Be Visible    gak ketemu nih!

the customer entered fewer than "3" letters in the Start Location field
    the customer clicks on the Start Location field
    Wait Until Element Is Visible    ${CARI_KOTA_KEBERANGKATAN}
    Input Text      ${CARI_KOTA_KEBERANGKATAN}    AT

text suggestions/auto complete should not be enabled
    Element Should Not Contain Text    ${SUGGESTED_CITY_LIST}    AT