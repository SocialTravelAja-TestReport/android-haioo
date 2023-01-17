*** Settings ***
Library     AppiumLibrary

*** Variables ***
${AUTOMATION_NAME}      UIAutomator2
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${DEVICE_NAME}          emulator-5554
${APP}                  ${EXECDIR}/app/0.1.2-dev(3).apk
${PACKAGE_NAME}         id.co.telkom.tnt.haioo.dev
${APP_ACTIVITY}         id.co.telkom.tnt.haioo.presentation.main.MainActivity

*** Keywords ***
Test Setup
    Open Application  ${REMOTE_URL}  platformName=${PLATFORM_NAME}  deviceName=${DEVICE_NAME}  automationName=${AUTOMATION_NAME}   appPackage=${PACKAGE_NAME}  autoGrantPermissions=true   appActivity=${APP_ACTIVITY}

Test Teardown
    Close Application