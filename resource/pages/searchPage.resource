*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Search Video
    [Arguments]    ${searchText}

    Wait Visible And Input Text    ${search.${PLATFORM_NAME}.searchInput}    ${searchText}


Select Search Video
    Wait Visible And Click Element    ${search.${PLATFORM_NAME}.resultSearch}

    ${result}    Get Text    ${search.${PLATFORM_NAME}.resultText}
    ${speaker}    ${title}    Split String    ${result}    separator=:${SPACE}

    Set Test Variable    ${speaker}
    Set Test Variable    ${title}

    Click Element    ${search.${PLATFORM_NAME}.resultText}