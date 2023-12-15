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
    Click on Shopping Cart
    Verify Success: Empty Cart

TC-03-002 Continue Shopping After Adding Product to Cart
    Click on Continue Shopping Button
    Verify Success: Redirected Back to Product List

TC-03-003 Your Information: Empty All Fields
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
    Click on Checkout Button
    Click on Cancel Button in Your Information Page
    Verify Success: Redirected back to Your Cart Page

TC-03-005 Overview: Validate Products
    Click on Checkout Button
    Input All Information
    Click on Continue in Information Page
    Verify Success: All Products are Here
    Verify Success: Correct Calculation

TC-03-006 Overview: Cancel Checkout
    Click on Checkout Button
    Input All Information
    Click on Continue in Information Page
    Click on Cancel Button in Overview Page
    Verify Success: Redirected Back to Product List

TC-03-007 Complete Checkout
    Click on Checkout Button
    Input All Information
    Click on Continue in Information Page
    Click on Finish Button in Overview Page
    Verify Success: Checkout Complete

TC-03-008 Complete: Back to Home
    Click on Checkout Button
    Input All Information
    Click on Continue in Information Page
    Click on Finish Button in Overview Page
    Verify Success: Checkout Complete
    Click on Back to Homepage Button in Complete Checkout Page
    Verify Success: Redirected Back to Product List