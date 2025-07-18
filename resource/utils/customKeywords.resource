*** Settings ***
Resource    ../../base.resource

Library    Collections

*** Keywords ***

Wait Visible And Click Element
    [Arguments]    ${locator}

    Wait Until Element Is Visible    ${locator}
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


Swipe In Direction Until Element Is Visible
    [Documentation]    Desliza a tela em uma direção especificada até que um determinado elemento se torne visível.
    ...
    ...    As direções de deslize (swipe) correspondem à ação física que um usuário faria na tela:
    ...    - *UP* (Para Cima): Desliza de baixo para cima para revelar o conteúdo que está na parte inferior da tela.
    ...    - *DOWN* (Para Baixo): Desliza de cima para baixo para revelar o conteúdo que está na parte superior da tela.
    ...    - *LEFT* (Para Esquerda): Desliza da direita para a esquerda para revelar o conteúdo que está à direita.
    ...    - *RIGHT* (Para Direita): Desliza da esquerda para a direita para revelar o conteúdo que está à esquerda.

    [Arguments]    ${locator}    ${direction}    ${max_swipes}=10

    # Garante que a direção seja maiúscula para evitar erros de digitação (ex: 'up' vs 'UP')
    ${direction_upper}    Set Variable    ${direction.upper()}

    # Obtém as dimensões da tela para calcular os pontos de swipe
    ${width}    Get Window Width
    ${height}    Get Window Height

    # Define as coordenadas de início (start) e o deslocamento (offset) com base na direção
    IF    '${direction_upper}' == 'UP'
        # Para ver o que está ABAIXO, desliza-se para CIMA
        ${start_x}=    Evaluate    ${width} / 2
        ${start_y}=    Evaluate    ${height} * 0.8  # Inicia na parte de baixo
        ${offset_x}=   Set Variable    0
        ${offset_y}=   Evaluate    -${height} * 0.6 # Move para cima
    ELSE IF    '${direction_upper}' == 'DOWN'
        # Para ver o que está ACIMA, desliza-se para BAIXO
        ${start_x}=    Evaluate    ${width} / 2
        ${start_y}=    Evaluate    ${height} * 0.2  # Inicia na parte de cima
        ${offset_x}=   Set Variable    0
        ${offset_y}=   Evaluate    ${height} * 0.6  # Move para baixo
    ELSE IF    '${direction_upper}' == 'LEFT'
        # Para ver o que está à DIREITA, desliza-se para a ESQUERDA
        ${start_x}=    Evaluate    ${width} * 0.8   # Inicia na direita
        ${start_y}=    Evaluate    ${height} / 2
        ${offset_x}=   Evaluate    -${width} * 0.6  # Move para a esquerda
        ${offset_y}=   Set Variable    0
    ELSE IF    '${direction_upper}' == 'RIGHT'
        # Para ver o que está à ESQUERDA, desliza-se para a DIREITA
        ${start_x}=    Evaluate    ${width} * 0.2   # Inicia na esquerda
        ${start_y}=    Evaluate    ${height} / 2
        ${offset_x}=   Evaluate    ${width} * 0.6   # Move para a direita
        ${offset_y}=   Set Variable    0
    ELSE
        Fail    Invalid direction provided: '${direction}'. Use [UP, DOWN, LEFT, or RIGHT].
    END

    # Loop para tentar encontrar o elemento, com um número máximo de tentativas
    FOR    ${i}    IN RANGE    ${max_swipes}
        # Verifica se o elemento está visível, com um timeout curto para não atrasar o teste
        ${is_visible}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${locator}    timeout=1s
        
        # Se o elemento foi encontrado, sai da keyword com sucesso
        IF    ${is_visible}
            RETURN
        END
        
        # Se não encontrou, realiza o swipe e tenta novamente na próxima iteração
        Log    Element '${locator}' not found. Swiping ${direction_upper}. Attempt #${i+1}
        Swipe    ${start_x}    ${start_y}    ${offset_x}    ${offset_y}
    END

    # Se o loop terminar e o elemento não for encontrado, o teste falhará com uma mensagem de erro clara
    Wait Until Page Contains Element    ${locator}    error=Element '${locator}' not found after ${max_swipes} swipes in the ${direction_upper} direction.

Return To Home Screen
    [Documentation]    Clica no botão "voltar" do dispositivo repetidamente até que a tela inicial seja visível.
    [Arguments]    ${max_attempts}=10

    FOR    ${i}    IN RANGE    ${max_attempts}
        ${is_home_visible}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.homeScreen}    timeout=1s
        IF    ${is_home_visible}
            RETURN
        END
        Press Keycode    4  # Keycode for Android Back Button
    END
    Fail    Could not return to home screen after ${max_attempts} attempts.
