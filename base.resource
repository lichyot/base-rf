*** Settings ***

### Biblioteca
Library    String
Library    DebugLibrary
Library    resource/lib/DotEnv.py
Library    AppiumLibrary    timeout=30
Library    BrowserstackLibrary    username=%{BS_USERNAME}    access_key=%{BS_ACCESS_KEY}

### Utils
Resource    resource/utils/openApp.resource
Resource    resource/utils/customKeywords.resource


### Locators
Variables    resource/locators/homeLocator.yml
Variables    resource/locators/signInLocator.yml
Variables    resource/locators/lookingForPage.yml
Variables    resource/locators/searchLocators.yml
Variables    resource/locators/welcomeLocators.yml
Variables    resource/locators/interestLocators.yml
Variables    resource/locators/resultSearchLocators.yml


### Pages
Resource    resource/pages/homePage.resource
Resource    resource/pages/signInPage.resource
Resource    resource/pages/welcomePage.resource
Resource    resource/pages/interestPage.resource
Resource    resource/pages/lookingForPage.resource
Resource    resource/pages/searchPage.resource
Resource    resource/pages/resultSearchPage.resource



*** Variables ***
# Configurações BrowserStack
${BS_BUILD_NAME}       TED
${BS_PROJECT_NAME}     RF Mobile
${EMULATOR}            browserstack    # browserstack || local

# Configurações do Dispositivo
${OS_VERSION}          13.0
${PLATFORM_NAME}       android
${DEVICE_NAME}         Google Pixel 7
${APP_URL}             bs://a3c064f995b68e06b8fa6ec28780d97c5ac46033