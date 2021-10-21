*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  https://www.amazon.in/ap/signin? openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.in%2F%3Fref_%3Dnav_ya_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=inflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&
${mobileprice}


*** Test Cases ***

LoginTest
    Launch Browser and open application
    Sign in to the application
    Add Item the cart
    Close the browser


*** Keywords ***
Launch Browser and open application
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()
    Call Method    ${options}    add_argument    incognito
    open browser    ${url}    ${browser}
    maximize browser window

Sign into the application
    input text  ap_email  bharat.gurnani88@gmail.com
    click button  continue
    input text  ap_password  Onsite@2020
    click button  signInSubmit
    wait until element is visible  //a[@id="nav-logo-sprites"]

Add Item the cart

    select from list by value  searchDropdownBox  search-alias=electronics
    input text  twotabsearchtextbox  one plus Mobile
    click element   nav-search-submit-button
    wait until element is visible  partial link :OnePlus Nord CE 5G
    scroll element into view  partial link :OnePlus Nord CE 5G
    click link  partial link :OnePlus Nord CE 5G
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    mouse over  //input[@id="add-to-cart-button" and @name="submit.add-to-cart"]
    click element  //input[@id="add-to-cart-button" and @name="submit.add-to-cart"]
    wait until element is visible  //input[@class='a-button-input' and @aria-labelledby='attach-sidesheet-view-cart-button-announce']
    click element  //input[@class='a-button-input' and @aria-labelledby='attach-sidesheet-view-cart-button-announce']
    wait until element is visible  //input[@value='Save for later' and @type="submit"]
    click element  //input[@value='Save for later' and @type="submit"]
    get selenium implicit wait

Close the browser

    delete all cookies
    close browser