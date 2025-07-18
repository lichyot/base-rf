*** Settings ***
Resource    ../../base.resource


*** Keywords ***
View Home
    Wait Until Element Is Visible    ${home.${PLATFORM_NAME}.homeScreen}


Click In Browser Icon
    Wait Visible And Click Element    ${home.${PLATFORM_NAME}.discoverButton}


Click in Surprise Me
    Swipe In Any Direction Until Element Is Visible    locator=${home.${PLATFORM_NAME}.surpriseMeButton}    direction=UP

    Click Element    ${home.${PLATFORM_NAME}.surpriseMeButton}


Click in Profile
    Swipe In Any Direction Until Element Is Visible    locator=${home.${PLATFORM_NAME}.myProfile}   direction=DOWN

    Click Element    ${home.${PLATFORM_NAME}.myProfile}


CLick in Talk - Paige Alexander
    Swipe In Any Direction Until Element Is Visible    locator=${home.${PLATFORM_NAME}.talkTransLive}   direction=LEFT

    Click Element     ${home.${PLATFORM_NAME}.talkTransLive}


CLick in Talk - Christine Schuler Deschryver
    Swipe In Any Direction Until Element Is Visible    locator=${home.${PLATFORM_NAME}.talkTransLive}   direction=LEFT

    Sleep     0.5

    Swipe In Any Direction Until Element Is Visible    locator=${home.${PLATFORM_NAME}.talkTenets}   direction=RIGHT

    Click Element     ${home.${PLATFORM_NAME}.talkTenets}