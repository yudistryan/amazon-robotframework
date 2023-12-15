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
    [Tags]    Positive
    [Documentation]     *Scenario:* Check the product sequence before and after sorting it by name, from
    ...                             product that start with Z to A.\n\n
    ...                 *Expected:* Products are sorted based on their name alphabetically descending.
    Get Product Sequence Before Sorting
    Sort Product By Name, Z-A
    Get Product Sequence After Sorting
    Verify Success: Products Sorted

TC-02-002 Sort Product: Name A-Z
    [Tags]    Positive
    [Documentation]     *Scenario:* Check the product sequence before and after sorting it by name, from
    ...                             product that start with A to Z.\n\n
    ...                 *Expected:* Products are sorted based on their name alphabetically ascending.
    Sort Product By Name, Z-A
    Get Product Sequence Before Sorting
    Sort Product By Name, A-Z
    Get Product Sequence After Sorting
    Verify Success: Products Sorted

TC-02-003 Sort Product: Price High-Low
    [Tags]    Positive
    [Documentation]     *Scenario:* Check the product sequence before and after sorting it by price, from
    ...                             highest to lowest.\n\n
    ...                 *Expected:* Products are sorted based on their price descending.
    Sort Product By Price, Low-High
    Get Product Sequence Before Sorting
    Sort Product By Price, High-Low
    Get Product Sequence After Sorting
    Verify Success: Products Sorted

TC-02-004 Sort Product: Price Low-High
    [Tags]    Positive
    [Documentation]     *Scenario:* Check the product sequence before and after sorting it by price, from
    ...                             lowest to highest.\n\n
    ...                 *Expected:* Products are sorted based on their name ascending.
    Sort Product By Price, High-Low
    Get Product Sequence Before Sorting
    Sort Product By Price, Low-High
    Get Product Sequence After Sorting
    Verify Success: Products Sorted

TC-02-005 Sidebar: All Items
    [Tags]    Positive
    [Documentation]     *Scenario:* Go to 'Your Cart' page then open sidebar and click on 'All Items' button.\n\n
    ...                 *Expected:* User is redirected to Homepage.
    Click All Add to Cart Buttons
    Open Sidebar
    Click on Reset App State Button in Sidebar
    Verify Success: Badge is Disappeared

TC-02-006 Sidebar: About
    [Tags]    Positive
    [Documentation]     *Scenario:* Open sidebar and click on 'About' button.\n\n
    ...                 *Expected:* User is redirected to Sauce Lab landing page.
    Open Sidebar
    Click on About Button in Sidebar
    Verify Success: User is Redirected to Sauce Lab Website

TC-02-007 Sidebar: Logout
    [Tags]    Positive
    [Documentation]     *Scenario:* Open sidebar and click on 'Log out' button.\n\n
    ...                 *Expected:* User is redirected to login page.
    Open Sidebar
    Click on Logout Button in Sidebar
    Verify Success: Logged Out

TC-02-008 Sidebar: Reset App State
    [Tags]    Positive
    [Documentation]     *Scenario:* Add all products to cart, then open sidebar and click on 
    ...                             'Reset App State' button then reload page.\n\n
    ...                 *Expected:* All products are removed from shopping cart.
    Click All Add to Cart Buttons
    Check If Cart Badge is Updated
    Click on Shopping Cart
    Check If All Products are Added to Cart
    Open Sidebar
    Click on All Items Button in Sidebar
    Verify Success: Redirected to All Items Page
    Open Sidebar
    Click on Reset App State Button in Sidebar
    Reload Page
    Verify Success: Badge is Disappeared

TC-02-009 Social Media: Twitter
    [Tags]    Positive
    [Documentation]     *Scenario:* Click on Twitter icon on bottom of page.\n\n
    ...                 *Expected:* User is redirected to Sauce Lab's twitter page.
    Click on Twitter Icon
    Verify Success: Redirected to Sauce Lab's Twitter

TC-02-010 Social Media: Facebook
    [Tags]    Positive
    [Documentation]     *Scenario:* Click on Facebook icon on bottom of page.\n\n
    ...                 *Expected:* User is redirected to Sauce Lab's facebook page.
    Click on Facebook Icon
    Verify Success: Redirected to Sauce Lab's Facebook

TC-02-011 Social Media: LinkedIn
    [Tags]    Positive
    [Documentation]     *Scenario:* Click on LinkedIn icon on bottom of page.\n\n
    ...                 *Expected:* User is redirected to Sauce Lab's linkedin page.
    Click on LinkedIn Icon
    Verify Success: Redirected to Sauce Lab's LinkedIn

TC-02-012 Add All Products to Cart
    [Tags]    Positive
    [Documentation]     *Scenario:* Click on all 'Add to Cart' button in Homepage.\n\n
    ...                 *Expected:* All products are added accurately in 'Your Cart' page.
    Click All Add to Cart Buttons
    Verify Success: Cart Badge is Updated
    Click on Shopping Cart
    Verify Success: All Products are Added to Cart

TC-02-013 Remove All Products from Cart
    [Tags]    Negative
    [Documentation]     *Scenario:* After add all products to cart, click on all 'Remove' button in Homepage.\n\n
    ...                 *Expected:* All products are removed accurately in 'Your Cart' page.
    Click All Add to Cart Buttons
    Verify Success: Cart Badge is Updated
    Click All Remove from Cart Buttons
    Verify Success: Badge is Disappeared

TC-02-014 All Product Details
    [Tags]    Positive
    [Documentation]     *Scenario:* Click on each product's name. Upon in product details page, verify 
    ...                             some of the details.\n\n
    ...                 *Expected:* All products' details is shown accurately in each page.
    Verify Success: Redirected to Product Details
# ====================================================================================================
