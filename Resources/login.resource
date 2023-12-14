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
${err_lockedCredential}    //h3[contains(.,'Sorry, this user has been locked out')]
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

Input ${user_type} Username
    [Arguments]    ${username}=${EMPTY}
    ${converted}    Convert To Lower Case    ${user_type}
    IF    "standard" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${standard_user}
    ELSE IF    "locked" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${locked_out_user}
    ELSE IF    "problem" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${problem_user}
    ELSE IF    "performance" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${performance_glitch_user}
    ELSE IF    "error" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${error_user}
    ELSE IF    "visual" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${visual_user}
    ELSE IF    "valid" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${standard_user}
    ELSE IF    "invalid" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${invalid_username1}
    ELSE IF    "empty" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${EMPTY}
    ELSE IF    "other" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_username}    ${username}
    END

Input ${password_type} Password
    [Arguments]    ${password}=${EMPTY}
    ${converted}    Convert To Lower Case    ${password_type}
    IF    "valid" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_password}    ${valid_password}
    ELSE IF    "invalid" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_password}    ${invalid_password}
    ELSE IF    "empty" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_password}    ${EMPTY}
    ELSE IF    "other" in $converted
        Wait Until Keyword Succeeds    10s    1s    Input Text    ${inp_password}    ${password}
    END

Clear ${field} Field
    ${converted}    Convert To Lower Case    ${field}
    IF    $converted == "username"
        Input Empty Username
    ELSE IF    $converted == "password"
        Input Empty Password
    END
    
Submit Login
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_submitLogin}
    
Verify Error: Empty Username Field
    Wait Until Element Is Visible    ${err_emptyUsername}    5s

Verify Error: Empty Password Field
    Wait Until Element Is Visible    ${err_emptyPassword}    5s

Verify Error: Invalid Credentials
    Wait Until Element Is Visible    ${err_invalidCredentials}    5s

Verify Error: Locked Out Account
    Wait Until Element Is Visible    ${err_lockedCredential}    5s
    
Close Error Message in Login Page
    Wait Until Keyword Succeeds    10s    1s    Click Element    ${btn_closeErrMessage}

Verify Success: Logged In
    Wait Until Element Is Visible    ${unq_appPage}    5s

Verify Error: All Images are Dog Picture
    @{image_sources}    Create List    ${img_sauceLabsBackpack}    ${img_sauceLabsBike}    ${img_sauceLabsBoltTshirt}
    ...    ${img_sauceLabsFleeceJacket}    ${img_sauceLabsOnesie}    ${img_sauceLabsRedTshirt}
    FOR    ${image}    IN    @{image_sources}
        ${image_source}    seleniumLibrary.Get Element Attribute    ${image}    src
        Run Keyword And Continue On Failure    Should Be Equal    ${image_source}    ${dogPicture}
    END

Verify Success: All Images are Relevant
    @{image_locators}    Create List    ${img_sauceLabsBackpack}    ${img_sauceLabsBike}    ${img_sauceLabsBoltTshirt}
    ...    ${img_sauceLabsFleeceJacket}    ${img_sauceLabsOnesie}    ${img_sauceLabsRedTshirt}
    @{image_sources}    Create List    ${backpackPicture}    ${bikeLightPicture}    ${boltTshirtPicture}
    ...    ${fleeceJacketPicture}    ${onesiePicture}    ${redTshirtPicture}
    FOR    ${index}    IN RANGE    6
        ${locator}    Get From List    ${image_locators}    ${index}
        ${source}    Get From List    ${image_sources}    ${index}
        ${image_source}    seleniumLibrary.Get Element Attribute    ${locator}    src
        Run Keyword And Continue On Failure    Should Be Equal    ${source}    ${image_source}
    END

Verify Error: Backpack Image is Dog Image Instead
    ${image_source}    seleniumLibrary.Get Element Attribute    ${img_sauceLabsBackpack}    src
    Run Keyword And Continue On Failure    Should Be Equal    ${dogPicture}    ${image_source}

Get Element X,Y Position
    [Arguments]    ${element}
    &{positions}    Execute Javascript    
    ...    var elem = window.document.evaluate("${element}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...    return elem.getBoundingClientRect();
    ${x}    Convert To String    ${positions}[x]
    ${y}    Convert To String    ${positions}[y]
    @{xy}    Create List    ${x}    ${y}
    RETURN   @{xy}

Verify Error: Shopping Cart is Misplaced
    @{position}    Get Element X,Y Position    ${btn_cartTop}
    Run Keyword And Continue On Failure    Should Not Be Equal    ${cart_x}    ${position}[0]
    Run Keyword And Continue On Failure    Should Not Be Equal    ${cart_y}    ${position}[1]

Verify Error: Red Tshirt's Add to Cart Button is Misplaced
    @{position}    Get Element X,Y Position    ${btn_redTshirt_addToCart}
    Run Keyword And Continue On Failure    Should Not Be Equal    ${addToCartRedT_x}    ${position}[0]
    Run Keyword And Continue On Failure    Should Not Be Equal    ${addToCartRedT_y}    ${position}[1]

Check If Element is Rotating
    [Arguments]    ${element}
    ${transform}    Execute Javascript    var elem = window.document.evaluate("${element}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    ...                                   return window.getComputedStyle(elem).transform;
    IF    $transform != 'none'
        RETURN    ${True}
    ELSE
        RETURN    ${False}
    END

Verify Error: Burger Menu is Rotating
    ${rotating}    Check If Element is Rotating    ${img_burger_icon}
    IF    $rotating == $False
        Fail    Burger Menu is not rotating.
    END
# ====================================================================================================