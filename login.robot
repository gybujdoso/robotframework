*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${BROWSER}                      Chrome
*** Test cases ***
Verify Open
    Open Browser    https://the-internet.herokuapp.com/login  ${BROWSER}
    Title Should Be  The Internet
    Wait Until Element Is Visible   id:username  timeout=3
Verify Login
    Input Text  id:username     tomsmith
    Wait Until Element Is Visible   id:password  timeout=3
    Input Text  id:password     SuperSecretPassword!
    Click Element  css:button[type="submit"]
Verify Logged
    Wait Until Element Is Visible   css:h2  timeout=3
    Element Text Should Be  css:h2  Secure Area
Verify Logout
    Click Element   css:[href="/logout"]
    Element Should Be Visible  css:h2   timeout=3
    Wait Until Page Contains  Login Page
    Element Text Should Be  css:h2  Login Page

    Close Browser

