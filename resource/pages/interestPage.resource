*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Select Interest
    [Arguments]    ${interestName}

    Wait Visible And Click Element    ${interest.${PLATFORM_NAME}.interestList.format(text='${interestName}')}
    Wait Enable And Click Element     ${interest.nextButton}