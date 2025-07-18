*** Settings ***

Resource    ../../base.resource


*** Keywords ***
Open Ted App
    Open Application
    ...    remote_url=http://localhost:4723/wd/hub
    ...    automationName=UiAutomator2
    ...    platformName=${PLATFORM_NAME}
    ...    deviceName=Pixel 7
    ...    app=${CURDIR}${/}..${/}app${/}ted.apk
    ...    disableIdLocatorAutocompletion=${True}