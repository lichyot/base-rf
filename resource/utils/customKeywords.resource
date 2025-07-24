*** Settings ***
Resource    ../../base.resource


*** Keywords ***
Wait Until Element Is Enabled
    [Arguments]    ${locator}
    [Timeout]    10s

    WHILE    ${True}
        ${status}    Run Keyword And Return Status    Element Should Be Enabled    ${locator}
        Exit For Loop If    ${status}
    END


Wait Visible And Click Element
    [Arguments]    ${locator}

    Wait Until Page Contains Element    ${locator}
    Click Element    ${locator}


Wait Enable And Click Element
    [Arguments]    ${locator}

    Wait Until Element Is Enabled    ${locator}
    Click Element    ${locator}


Wait Visible And Input Text
    [Arguments]    ${locator}    ${text}

    Wait Visible And Click Element    ${locator}
    Is Keyboard Shown
    Input Text    ${locator}    ${text}


Access TED APP Without Login
    [Arguments]    ${interest}    ${lookingFor}

    Click In Lets Go
    Select Interest       ${interest}
    Select Looking For   ${lookingFor}
    Skip Sing In
    View Home


Swipe In Any Direction Until Element Is Visible
    [Documentation]    Desliza a tela na direção informada (UP, DOWN, LEFT ou RIGHT) até que o elemento desejado esteja visível.
    ...
    ...    - *UP*: desliza de baixo para cima → revela conteúdo inferior
    ...    - *DOWN*: desliza de cima para baixo → revela conteúdo superior
    ...    - *LEFT*: desliza da direita para a esquerda → revela conteúdo à direita
    ...    - *RIGHT*: desliza da esquerda para a direita → revela conteúdo à esquerda

    [Arguments]    ${locator}    ${direction}    ${max_swipes}=10

    ${direction_upper}=    Set Variable    ${direction.upper()}
    ${width}=    Get Window Width
    ${height}=    Get Window Height

    # Inicializa variáveis
    ${start_x}=    Set Variable    0
    ${start_y}=    Set Variable    0
    ${end_x}=      Set Variable    0
    ${end_y}=      Set Variable    0

    # Define coordenadas baseadas na direção desejada
    IF    '${direction_upper}' == 'UP'
        ${start_x}=    Evaluate    ${width} / 2
        ${start_y}=    Evaluate    ${height} * 0.8
        ${end_x}=      Set Variable    ${start_x}
        ${end_y}=      Evaluate    ${height} * 0.2
    ELSE IF    '${direction_upper}' == 'DOWN'
        ${start_x}=    Evaluate    ${width} / 2
        ${start_y}=    Evaluate    ${height} * 0.2
        ${end_x}=      Set Variable    ${start_x}
        ${end_y}=      Evaluate    ${height} * 0.8
    ELSE IF    '${direction_upper}' == 'LEFT'
        ${start_x}=    Evaluate    ${width} * 0.8
        ${start_y}=    Evaluate    ${height} * 0.6
        ${end_x}=      Evaluate    ${width} * 0.2
        ${end_y}=      Set Variable    ${start_y}
    ELSE IF    '${direction_upper}' == 'RIGHT'
        ${start_x}=    Evaluate    ${width} * 0.2
        ${start_y}=    Evaluate    ${height} * 0.6
        ${end_x}=      Evaluate    ${width} * 0.8
        ${end_y}=      Set Variable    ${start_y}
    ELSE
        Fail    Invalid direction '${direction}'. Use one of: UP, DOWN, LEFT, RIGHT.
    END

    FOR    ${i}    IN RANGE    ${max_swipes}
        ${is_visible}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${locator}    timeout=1s
        IF    ${is_visible}
            RETURN
        END
        Log    Element '${locator}' not found. Swiping ${direction_upper}. Attempt #${i+1}
        Log    Swipe from (${start_x}, ${start_y}) to (${end_x}, ${end_y})
        Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}
    END

    Wait Until Page Contains Element    ${locator}    error=Element '${locator}' not found after ${max_swipes} swipes in the ${direction_upper} direction.


Conditional Teardown
    IF    '${EMULATOR}' == 'browserstack'
        Update Test Case Status in BrowserStack
    END

    Close All Applications