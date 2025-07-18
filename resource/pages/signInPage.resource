*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Skip Sing In
    Wait Enable And Click Element    ${signIn.${PLATFORM_NAME}.skipButton}