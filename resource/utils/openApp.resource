*** Settings ***

Resource    ../../base.resource


*** Keywords ***
Open Ted App
    IF    '${EMULATOR}' == 'local'
        Open Application
        ...    remote_url=http://localhost:4723/wd/hub
        ...    automationName=UiAutomator2
        ...    platformName=${PLATFORM_NAME}
        ...    deviceName=Pixel 7
        ...    app=${CURDIR}${/}..${/}app${/}ted.apk
        ...    disableIdLocatorAutocompletion=${True}
        ...    newCommandTimeout=300
    ELSE IF    '${EMULATOR}' == 'browserstack'
        Open Application In Browserstack
        ...    deviceName=${DEVICE_NAME}
        ...    platformName=${PLATFORM_NAME}
        ...    project=${BS_PROJECT_NAME}
        ...    build=${BS_BUILD_NAME}
        ...    name=${TEST_NAME}
        ...    browserstack.debug=${True}
        ...    browserstack.networkLogs=${True}
        ...    framework=robot
        ...    disableIdLocatorAutocompletion=${True}
        ...    browserstack.idleTimeout=300
        ...    newCommandTimeout=300
        ...    testObservability=${True}
        ...    interactiveDebugging=${True}
        ...    browserstackAutomation=${True}
        ...    browserstack.appiumLogs=${True}
    END
