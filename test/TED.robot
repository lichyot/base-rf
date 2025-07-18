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
    Wait Until Page Contains Element    ${home.${PLATFORM_NAME}.homeButton}


Cenário: Acessar Perfil
    [Tags]    c4

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth
    Click in My Profile
    Click in Sign In
    Click in Sign In With Email
    Click in Forgot Password
    Return To Home Screen
