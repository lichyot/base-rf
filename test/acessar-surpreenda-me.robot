*** Settings ***
Resource    ../base.resource

Test Tags    robot:exclude


*** Test Cases ***
Cenário: Acessar Surpreenda-me
    [Tags]    surpreenda-1

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click in Surprise Me
    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.surpriseMeEnga}


Cenário: Acessar Surpreenda-me & Voltar pra Home e faz Swipe para o topo
    [Tags]    surpreenda-2

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click in Surprise Me

    Click Element    ${home.${PLATFORM_NAME}.homeButton}

    Click in Profile
    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.myProfContainer}