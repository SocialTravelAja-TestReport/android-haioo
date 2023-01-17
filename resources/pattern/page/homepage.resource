*** Settings ***
Library     AppiumLibrary

*** Variables ***
${DISCOVERY}    xpath=//android.widget.FrameLayout[@content-desc="Discover"]/android.widget.ImageView
${ITINERARY}    xpath=/android.widget.FrameLayout[@content-desc="Itinerary"]/android.widget.ImageView
${BELANJA}      xpath=//android.widget.FrameLayout[@content-desc="Belanja"]/android.widget.ImageView
${PROFIL}       xpath=//android.widget.FrameLayout[@content-desc="Profil"]/android.widget.ImageView