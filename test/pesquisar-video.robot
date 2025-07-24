*** Settings ***
Resource    ../base.resource

Test Tags    robot:exclude


*** Test Cases ***
Cenário: Realizar Pesquisa por Vídeo
    [Tags]    search-1    Skeep

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click In Browser Icon
    Search Video    Technology
    Select Search Video
    View Result Search


Cenário: Swipe da Direita para Esquerda
    [Tags]    search-2

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth

    CLick in Talk - Paige Alexander

    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.speakerPage}


Cenário: Swipe da Esquerda para Direita
    [Tags]    search-3

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth

    CLick in Talk - Christine Schuler Deschryver

    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.speakerChris}
    