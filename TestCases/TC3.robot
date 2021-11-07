*** Settings ***
Documentation  GoogleTestCase
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http:/www.google.com


*** Test Cases ***
LoginTest
   [Documentation]  Google Basic Test Case
   [Tags]  Functional
   open browser    ${url}    ${browser}
   close browser