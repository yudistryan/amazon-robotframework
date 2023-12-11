# ====================================================================================================
*** Settings ***
Documentation    Resources management for *CHECKOUT* test suite.
...
...
...                                    ...|GLOSSARY|...
...    btn = Clickable element or a button.
...    unq = Unique element of a page. Usually used to verify page/section or something similiar.
...    inp = Editable element or an input.
...    err = Element that represent error like erorr message, red alert icon, etc.
...    img = Element in picture format like svg, img or etc.
...    txt = Element that is a text whether it is inside or in text format like H1, H2, etc.
...    drd = Element that represent dropdown selection, section or something similiar.
...    opt = Element that represent an option from dropdown, radio button or something similiar.
...    box = Elemeent that represent checkbox or multiple selection.
Resource    imports.resource
# ====================================================================================================



# ====================================================================================================
*** Variables ***
${unq_loginPage}    //div[@class='login_logo']
${inp_username}    //input[@id='user-name']
${inp_password}    //input[@id='password']
${btn_submitLogin}    //input[@id='login-button']
${err_emptyUsername}    //h3[contains(.,'Username is required')]
${err_emptyPassword}    //h3[contains(.,'Password is required')]
${err_invalidCredentials}    //h3[contains(.,'Username and password do not match any user in this service')]
${btn_closeErrMessage}    //button[@class='error-button']
# ====================================================================================================



# ====================================================================================================
*** Keywords ***
Login Setup
    ${login_page}    Run Keyword And Return Status    Element Should Be Visible    ${unq_loginPage}
    IF    not $login_page
        Go To    ${base_url}
    ELSE
        Reload Page
    END

Input Valid Username
    [Arguments]    ${username}=${valid_username1}
    Input Text    ${inp_username}    ${username}

Input Invalid Username
    [Arguments]    ${username}=${invalid_username1}
    Input Text    ${inp_username}    ${username}

Input Valid Password
    [Arguments]    ${password}=${valid_password}
    Input Text    ${inp_password}    ${password}

Input Invalid Password
    [Arguments]    ${password}=${invalid_password}
    Input Text    ${inp_password}    ${password}

Submit Login
    Click Element    ${btn_submitLogin}
    
Verify Error: Empty Username Field
    Wait Until Element Is Visible    ${err_emptyUsername}    5s

Verify Error: Empty Password Field
    Wait Until Element Is Visible    ${err_emptyPassword}    5s

Verify Error: Invalid Credentials
    Wait Until Element Is Visible    ${err_invalidCredentials}    5s
    
Close Error Message in Login Page
    Click Element    ${btn_closeErrMessage}

Clear ${field} Field
    ${converted}    Convert To Lower Case    ${field}
    IF    $converted == "username"
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${EMPTY}
    ELSE IF    $converted == "password"
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_password}    ${EMPTY}
    END
# ====================================================================================================