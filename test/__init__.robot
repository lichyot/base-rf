*** Settings ***
Resource    ../base.resource


Suite Setup      Send App To Browserstack
Test Setup       Open Ted App
Test Teardown    Conditional Teardown


*** Keywords ***
Send App To Browserstack
    IF    '${EMULATOR}' == 'browserstack' 
        Upload Application to Browserstack
            ...    app_name=ted.apk
            ...    app_path=${CURDIR}${/}..${/}resource${/}app${/}ted.apk
            ...    custom_id=TED_2
    END