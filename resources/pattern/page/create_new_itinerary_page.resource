*** Settings ***
Library     AppiumLibrary

*** Variables ***
${CREATE_ITINERARY_NAMA_TRIP}           id=et_trip_name
${CREATE_ITINERARY_START_LOC}           id=et_departure_location
${CREATE_ITINERARY_DEST_LOC}            id=et_arrival_location
${CREATE_ITINERARY_DATE}                id=et_trip_date
${CREATE_ITINERARY_PRIVATE}             id=rb_private
${CREATE_ITINERARY_PUBLIC}              id=rb_public
${CREATE_ITINERARY_CONFIRM_BUTTON}      id=btn_create_new_trip
${SELECT_START_CITY_MODAL}              id=design_bottom_sheet
${CARI_KOTA_KEBERANGKATAN}              id=id.co.telkom.tnt.haioo.dev:id/et_search
${SUGGESTED_CITY_LIST}                  id=id.co.telkom.tnt.haioo.dev:id/tv_location_title