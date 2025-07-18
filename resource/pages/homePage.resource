*** Settings ***
Resource    ../../base.resource


*** Keywords ***
View Home
    Wait Until Element Is Visible    ${home.${PLATFORM_NAME}.homeScreen}


Click In Browser Icon
    Wait Visible And Click Element    ${home.${PLATFORM_NAME}.discoverButton}


Click in Surprise Me
    Swipe In Direction Until Element Is Visible    locator=${home.${PLATFORM_NAME}.surpriseMeButton}    direction=UP

    Click Element    ${home.${PLATFORM_NAME}.surpriseMeButton}


Back in Top Screen
    Swipe In Direction Until Element Is Visible    locator=${home.${PLATFORM_NAME}.myProfile}   direction=DOWN

    Click Element    ${home.${PLATFORM_NAME}.myProfile}