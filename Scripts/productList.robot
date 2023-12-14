# ====================================================================================================
*** Settings ***
Documentation    Contains test scenarios for login page.
Resource    ../Resources/imports.resource
Suite Setup    General Suite Setup
Test Setup    App Page Setup
Suite Teardown    End Testing
# ====================================================================================================



# ====================================================================================================
*** Variables ***
# ====================================================================================================



# ====================================================================================================
*** Test Cases ***
TC-02-001 Sort Product: Name Z-A
    Get Product Sequence Before Sorting
    Sort Product By Name, Z-A
    Get Product Sequence After Sorting
    Verify Success: Products Sorted

TC-02-002 Sort Product: Name A-Z
    Sort Product By Name, Z-A
    Get Product Sequence Before Sorting
    Sort Product By Name, A-Z
    Get Product Sequence After Sorting
    Verify Success: Products Sorted

TC-02-003 Sort Product: Price High-Low
    Sort Product By Price, Low-High
    Get Product Sequence Before Sorting
    Sort Product By Price, High-Low
    Get Product Sequence After Sorting
    Verify Success: Products Sorted

TC-02-004 Sort Product: Price Low-High
    Sort Product By Price, High-Low
    Get Product Sequence Before Sorting
    Sort Product By Price, Low-High
    Get Product Sequence After Sorting
    Verify Success: Products Sorted

TC-02-005 Sidebar: All Items
    Click All Add to Cart Buttons
    Open Sidebar
    Click on Reset App State Button in Sidebar
    Verify Success: Badge is Disappeared

TC-02-006 Sidebar: About
    Open Sidebar
    Click on About Button in Sidebar
    Verify Success: User is Redirected to Sauce Lab Website

TC-02-007 Sidebar: Logout
    Open Sidebar
    Click on Logout Button in Sidebar
    Verify Success: Logged Out

TC-02-008 Sidebar: Reset App State
    Click on Shopping Cart
    Open Sidebar
    Click on All Items Button in Sidebar
    Verify Success: Redirected to All Items Page

TC-02-009 Social Media: Twitter
    Click on Twitter Icon
    Verify Success: Redirected to Sauce Lab's Twitter

TC-02-010 Social Media: Facebook
    Click on Facebook Icon
    Verify Success: Redirected to Sauce Lab's Facebook

TC-02-011 Social Media: LinkedIn
    Click on LinkedIn Icon
    Verify Success: Redirected to Sauce Lab's LinkedIn

TC-02-012 Add All Products to Cart
    Click All Add to Cart Buttons
    Verify Success: Cart Badge is Updated
    Click on Shopping Cart
    Verify Success: All Products are Added to Cart

TC-02-013 Remove All Products from Cart
    Click All Add to Cart Buttons
    Verify Success: Cart Badge is Updated
    Click All Remove from Cart Buttons
    Verify Success: Badge is Disappeared
# ====================================================================================================
