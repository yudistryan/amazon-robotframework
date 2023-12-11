# ====================================================================================================
*** Settings ***
Documentation    Contains test scenarios for login page using Test Data-Driven.
Resource    ../Resources/imports.resource
Suite Setup    General Suite Setup
Test Setup    Login Setup
Test Template    Login with Invalid Credentials
Suite Teardown    End Testing
# ====================================================================================================



# ====================================================================================================
*** Test Cases ***                Username                Password
Invalid Username 1              ${invalid_username1}    ${valid_password}
Invalid Username 2              ${invalid_username2}    ${valid_password}
Invalid Username 3              ${invalid_username3}    ${valid_password}
Invalid Username 4              ${invalid_username4}    ${valid_password}
Invalid Username 5              ${invalid_username5}    ${valid_password}
Invalid Username 6              ${invalid_username6}    ${valid_password}
Invalid Password                ${valid_username1}      ${invalid_password}
Invalid Username & Password     ${invalid_username1}    ${invalid_password}
# ====================================================================================================



# ====================================================================================================
*** Keywords ***
Login with Invalid Credentials
    [Tags]    Negative
    [Documentation]     *Scenario:* Login using multiple invalid usernames with an invalid password.\n\n
    ...                 *Expected:* Show error message that indicates username and password is not matched.
    [Arguments]    ${username}    ${password}
    Input Invalid Username    ${username}
    Input Invalid Password    ${password}
    Submit Login
    Verify Error: Invalid Credentials
    Close Error Message in Login Page
# ====================================================================================================
