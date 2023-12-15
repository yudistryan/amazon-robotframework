# ====================================================================================================
*** Settings ***
Documentation    Contains test scenarios for checkout process.
Resource    ../Resources/imports.resource
Suite Setup    General Suite Setup
Test Setup    Checkout Setup
Test Teardown    Checkout Teardown
Suite Teardown    End Testing
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# ====================================================================================================



# ====================================================================================================
*** Test Cases ***
TC-03-001 Empty Cart
    [Tags]    Negative
    [Documentation]     *Scenario:* Go to shopping cart without adding any product.\n\n
    ...                 *Expected:* No products is remained upon going to 'Your Cart' page.
    Click on Shopping Cart
    Verify Success: Empty Cart

TC-03-002 Continue Shopping After Adding Product to Cart
    [Tags]    Negative
    [Documentation]     *Scenario:* After adding all products to cart, click on 'Continue Shopping' button.\n\n
    ...                 *Expected:* User is redirected to Homepage.
    Click on Continue Shopping Button
    Verify Success: Redirected Back to Product List

TC-03-003 Your Information: Empty All Fields
    [Tags]    Negative
    [Documentation]     *Scenario:* Empty first name, last name and postal code and click 'Continue' button.
    ...                             Empty all concurrently then empty one field at a time respectively.\n\n
    ...                 *Expected:* Showing error message that indicates either first name, last name or postal
    ...                             code is required.
    Click on Checkout Button
    Click on Continue in Information Page
    Verify Error: Empty First Name
    Input First Name Field
    Click on Continue in Information Page
    Verify Error: Empty Last Name
    Input Last Name Field
    Click on Continue in Information Page
    Verify Error: Empty Postal Code

TC-03-004 Your Information: Cancel Checkout
    [Tags]    Negative
    [Documentation]     *Scenario:* After going to 'Your Information' page, click 'Cancel' button.\n\n
    ...                 *Expected:* User is redirected to 'Your Cart' page.
    Click on Checkout Button
    Click on Cancel Button in Your Information Page
    Verify Success: Redirected back to Your Cart Page

TC-03-005 Overview: Validate Products
    [Tags]    Positive
    [Documentation]     *Scenario:* Add all products and proceed to 'Overview' page then validate shown data
    ...                             including product's name, price, subtotal price, tax and total price.\n\n
    ...                 *Expected:* All added products showing the same data as in the homepage and price
    ...                             calculation is accurate.
    Click on Checkout Button
    Input All Information
    Click on Continue in Information Page
    Verify Success: All Products are Here
    Verify Success: Correct Calculation

TC-03-006 Overview: Cancel Checkout
    [Tags]    Negative
    [Documentation]     *Scenario:* After add all products, proceed to 'Overview' page then click 'Cancel'
    ...                             button.\n\n
    ...                 *Expected:* User is redirected to Homepage.
    Click on Checkout Button
    Input All Information
    Click on Continue in Information Page
    Click on Cancel Button in Overview Page
    Verify Success: Redirected Back to Product List

TC-03-007 Complete Checkout
    [Tags]    Positive
    [Documentation]     *Scenario:* After adding all products, proceed until checkout complete.\n\n
    ...                 *Expected:* User is redirected to checkout complete page.
    Click on Checkout Button
    Input All Information
    Click on Continue in Information Page
    Click on Finish Button in Overview Page
    Verify Success: Checkout Complete

TC-03-008 Complete: Back to Home
    [Tags]    Positive
    [Documentation]     *Scenario:* After completing checkout, click on "Go Back to Home" button.\n\n
    ...                 *Expected:* User is redirected to Homepage.
    Click on Checkout Button
    Input All Information
    Click on Continue in Information Page
    Click on Finish Button in Overview Page
    Verify Success: Checkout Complete
    Click on Back to Homepage Button in Complete Checkout Page
    Verify Success: Redirected Back to Product List