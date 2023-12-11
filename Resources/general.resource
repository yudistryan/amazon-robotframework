*** Settings ***
Resource    imports.resource

*** Keywords ***
General Suite Setup
    Open Browser    ${base_url}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${unq_loginPage}

End Testing
    Close Browser

Create Invalid Usernames
    @{invalid_usernames}    Create List    ${invalid_username1}    ${invalid_username2}    ${invalid_username3}
    ...    ${invalid_username4}    ${invalid_username5}    ${invalid_username6}
    RETURN    @{invalid_usernames}