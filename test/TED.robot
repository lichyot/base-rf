*** Settings ***

Resource    ../base.resource

Test Setup       Open Ted App
Test Teardown    Close All Applications


*** Test Cases ***
Cenário: Acessar Aplicativo
    [Tags]    c1

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth


Cenário: Realizar Pesquisa por Vídeo
    [Tags]    c2

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click In Browser Icon
    Search Video    Tecnology
    Select Search Video
    View Result Search


Cenário: Acessar Surpreenda-me
    [Tags]    c3

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click in Surprise Me
    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.surpriseMeEnga}


Cenário: Acessar Surpreenda-me & Voltar pra Home e faz Swipe para o topo
    [Tags]    c4

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click in Surprise Me

    Click Element    ${home.${PLATFORM_NAME}.homeButton}

    Click in Profile
    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.myProfContainer}


Cenário: Swipe da Direita para Esquerda
    [Tags]    c5

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth

    CLick in Talk - Paige Alexander

    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.speakerPage}


Cenário: Swipe da Esquerda para Direita
    [Tags]    c6

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth

    CLick in Talk - Christine Schuler Deschryver

    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.speakerChris}