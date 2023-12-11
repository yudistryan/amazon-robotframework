# ====================================================================================================
*** Settings ***
Documentation    Contains test scenarios for login page.
Resource    ../Resources/imports.resource
Suite Setup    General Suite Setup
Test Setup    Login Setup
Suite Teardown    End Testing
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# ====================================================================================================



# ====================================================================================================
*** Test Cases ***
TC-01-001 Empty All Fields
    [Tags]    Negative
    [Documentation]     *Scenario:* Empty username and password fields in login page and submit.\n\n
    ...                 *Expected:* Show error message that indicates fields cannot be empty.
    Submit Login
    Verify Error: Empty Username Field
    Close Error Message in Login Page
    
TC-01-002 Empty Username Fields
    [Tags]    Negative
    [Documentation]     *Scenario:* Empty username field in login page and submit.\n\n
    ...                 *Expected:* Show error message that indicates username field cannot be empty.
    Input Valid Password
    Submit Login
    Verify Error: Empty Username Field
    Close Error Message in Login Page
    
TC-01-003 Empty Email Fields
    [Tags]    Negative
    [Documentation]     *Scenario:* Empty password field in login page and submit.\n\n
    ...                 *Expected:* Show error message that indicates password field cannot be empty.
    Input Valid Username
    Clear Password Field
    Submit Login
    Verify Error: Empty Password Field
    Close Error Message in Login Page

TC-01-004 Invalid Credentials
    [Tags]    Negative
    [Documentation]     *Scenario:* Login using multiple invalid usernames with an invalid password.\n\n
    ...                 *Expected:* Show error message that indicates username and password is not matched.
    @{invalid_usernames}    Create Invalid Usernames
    FOR    ${username}    IN    @{invalid_usernames}
        Input Invalid Username    ${username}
        Input Invalid Password
        Submit Login
        Verify Error: Invalid Credentials
        Close Error Message in Login Page
    END
# ====================================================================================================



# ====================================================================================================
*** Keywords ***
# ====================================================================================================
