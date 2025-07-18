*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Select Looking For
    [Arguments]    ${lookingForName}

    Wait Visible And Click Element    ${lookingFor.${PLATFORM_NAME}.lookingForList.format(text='${lookingForName}')}
    Wait Enable And Click Element     ${lookingFor.nextButton}
