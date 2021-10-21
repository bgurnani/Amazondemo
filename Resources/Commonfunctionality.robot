*** Settings ***
Library  SeleniumLibrary



*** Variables ***
${browser}  chrome
${url}  https://www.amazon.in/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.in%2F%3Fref_%3Dnav_ya_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=inflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&
${mobileprice}

*** Keywords ***
Launch Browser and open application
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()
    Call Method    ${options}    add_argument    incognito
    open browser    ${url}    ${browser}
    maximize browser window

Close the browser

    delete all cookies
    close browser