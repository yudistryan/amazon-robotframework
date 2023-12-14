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