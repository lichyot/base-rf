*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Click In Lets Go
    Wait Visible And Click Element    ${welcome.nextButton}