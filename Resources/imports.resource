*** Settings ***
Documentation    Store all resources including library, data and resource files. 
Library    SeleniumLibrary    screenshot_root_directory=EMBED
Library    ScreenCapLibrary
Library    Dialogs
Library    XML
Library    OperatingSystem
Library    Collections
Library    String
Library    ../Libraries/dataProcessing.py
Resource    data.resource
Resource    general.resource
Resource    login.resource
Resource    productListPage.resource
Resource    cart.resource
Resource    productDetails.resource
Resource    checkout.resource
