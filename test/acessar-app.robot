*** Settings ***
Resource    ../base.resource


*** Test Cases ***
Cenário: Acessar Aplicativo
    [Tags]    acessar-1

    Access TED APP Without Login    interest=Technology    lookingFor=Professional growth