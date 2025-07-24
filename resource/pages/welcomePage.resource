*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Click In Lets Go
    # Sleep    100s
    Wait Visible And Click Element    ${welcome.nextButton}