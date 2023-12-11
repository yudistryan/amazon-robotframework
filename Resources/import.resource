*** Settings ***
Documentation    Store all resources including library and resource files. 
Library    SeleniumLibrary    screenshot_root_directory=EMBED
Library    ScreenCapLibrary
Library    Dialogs
Library    XML
Library    OperatingSystem
Library    Collections
Library    String
Resource    homepage.resource