*** Settings ***

### Biblioteca
Library    String
Library    YamlLib
Library    DebugLibrary
Library    AppiumLibrary    timeout=30

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
${PLATFORM_NAME}    android