*** Settings ***
Library    Selenium2Library

*** Variables ***
${URL}       https://automationinterface1.front.staging.optimy.net/en/
${username}  optimyautomationtester@gmail.com
${password}  yRMhojb7
${BROWSER}   Chrome

*** Test Cases ***
Verify successful submission of a new application
    [Tags]  submit_once
    [Setup]  Open Browser and Allow Cookies
    Given Applicant's Personal Details
    And Home Page is displayed with Login button
    When Applicant logs in
    And Applicant continues to submit application
    Then Applicant is able to fill out the form
    And Applicant is able to validate details and send
    And Applicant successfully submits the application
    And Applicant goes back to Home page

Verify successful submission of a new application is rerunnable for 10 times
    [Tags]  submit_ten_times
    [Setup]  Open Browser and Allow Cookies
    Given Applicant's Personal Details
    And Home Page is displayed with Login button
    When Applicant logs in
    Then Applicant is able to submit application 10 times

*** Keywords ***
Open Browser and Allow Cookies
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    ${allowCookies}  Run Keyword and Return Status  Page Should Contain Button  css=#cookie-allow-all-button
    IF  '${allowCookies}'=='True'  Click Button    css=#cookie-allow-all-button

Applicant's Personal Details
    &{personalInfo}  Create Dictionary  firstName=testFN  lastName=testLN  extension=testExt  address=testAdd  postalCode=1000  careerObj=testCO
    Set Test Variable  &{personalInfo}

Home Page is displayed with Login button
    Wait Until Page Contains Element  css=.btn-outline-primary
    Click Element  css=.btn-outline-primary

Applicant logs in
    Wait Until Page Contains  Sign in
    Click Element  css=#login-email
    Input Text    css=#login-email  ${username}
    Click Element  css=#login-password
    Input Text    css=#login-password  ${password}
    Click Button  css=.mt-md-2

Applicant continues to submit application
    Wait Until Page Contains Element  css=.col-md-auto
    Set Focus To Element    css=.col-md-auto
    Click Link  css=.col-md-auto
    ${continue}  Run Keyword and Return Status  Page Should Contain  Continue with the submission of the application
    IF  '${continue}'=='True'  Page Should Contain Element   css=.btn-outline-primary
    ...  ELSE  Wait Until Page Contains  Continue with the submission of the application
    Click Element  css=.btn-outline-primary

Applicant is able to fill out the form
    Wait Until Page Contains  Fill-out all forms
    Wait Until Page Contains Element  xpath=//*[@id="629d7b5a-f6a1-5a14-ac1d-21b2fafdbdef"]
    #css=#629d7b5a-f6a1-5a14-ac1d-21b2fafdbdef
    Set Focus To Element  xpath=//*[@id="629d7b5a-f6a1-5a14-ac1d-21b2fafdbdef"]
    Click Element  xpath=//*[@id="629d7b5a-f6a1-5a14-ac1d-21b2fafdbdef"]
    Input Text  xpath=//*[@id="629d7b5a-f6a1-5a14-ac1d-21b2fafdbdef"]  ${personalInfo.firstName}
    #css=#23e5e47e-bab1-5a1e-9929-f180182bda43
    Set Focus To Element  xpath=//*[@id="23e5e47e-bab1-5a1e-9929-f180182bda43"]
    Click Element  xpath=//*[@id="23e5e47e-bab1-5a1e-9929-f180182bda43"]
    Input Text  xpath=//*[@id="23e5e47e-bab1-5a1e-9929-f180182bda43"]  ${personalInfo.lastName}
    #css=#65b3b6bd-3654-5a86-b86e-481f2bbfb391
    Set Focus To Element  xpath=//*[@id="65b3b6bd-3654-5a86-b86e-481f2bbfb391"]
    Click Element  xpath=//*[@id="65b3b6bd-3654-5a86-b86e-481f2bbfb391"]
    Input Text  xpath=//*[@id="65b3b6bd-3654-5a86-b86e-481f2bbfb391"]  ${personalInfo.extension}
    #css=#7172c3f2-f508-5f9c-82a1-11ce9d0f3edc::c3f44a2e-72e9-587b-b88c-b5c9fbeed2db
    Set Focus To Element  xpath=//*[@id="7172c3f2-f508-5f9c-82a1-11ce9d0f3edc::c3f44a2e-72e9-587b-b88c-b5c9fbeed2db"]
    Click Element  xpath=//*[@id="7172c3f2-f508-5f9c-82a1-11ce9d0f3edc::c3f44a2e-72e9-587b-b88c-b5c9fbeed2db"]
    Input Text  xpath=//*[@id="7172c3f2-f508-5f9c-82a1-11ce9d0f3edc::c3f44a2e-72e9-587b-b88c-b5c9fbeed2db"]  ${personalInfo.address}
    #css=#container_e57df0b5-c2ad-514a-967f-ee8b962f5ed4 > div > input
    Set Focus To Element  xpath=//*[@id="container_e57df0b5-c2ad-514a-967f-ee8b962f5ed4"]/div/input
    Click Element  xpath=//*[@id="container_e57df0b5-c2ad-514a-967f-ee8b962f5ed4"]/div/input
    Input Text  xpath=//*[@id="container_e57df0b5-c2ad-514a-967f-ee8b962f5ed4"]/div/input  1000${SPACE}
    Wait Until Page Contains Element   xpath=//ul[@id="ui-id-1"]/li
    Click Element    xpath=//ul[@id="ui-id-1"]/li
    #css=#7e595970-fc12-558c-9eaf-385735fcae6b
    Set Focus To Element  xpath=//*[@id="7e595970-fc12-558c-9eaf-385735fcae6b"]
    Select From List By Value    xpath=//*[@id="7e595970-fc12-558c-9eaf-385735fcae6b"]  PH
    #css=#upload_d370f504-7ff5-509f-babb-d80126387290 > div > div > div.p-4.qq-uploader-selector__wrapper.text-center > div.btn.btn-outline-primary.qq-upload-button-selector.qq-upload-button-hover > input[type=file]
    Set Focus To Element  xpath=//*[@id="upload_d370f504-7ff5-509f-babb-d80126387290"]/div/div/div[1]/div[2]/input
    Choose File    xpath=//*[@id="upload_d370f504-7ff5-509f-babb-d80126387290"]/div/div/div[1]/div[2]/input    ${CURDIR}/test.jpg
    #css=#container_514632f0-b9ec-5946-997e-f486fcd8276c > label > div > div.custom-control-label.radio-checkbox-li-element-label
    Set Focus To Element  xpath=//*[@id="container_514632f0-b9ec-5946-997e-f486fcd8276c"]/label/div/div[1]
    Click Element  xpath=//*[@id="container_514632f0-b9ec-5946-997e-f486fcd8276c"]/label/div/div[1]
    #css=#field_f801d7d8-0762-5407-95f9-b8c3a793157c
    Set Focus To Element  xpath=//*[@id="field_f801d7d8-0762-5407-95f9-b8c3a793157c"]
    Click Element  xpath=//*[@id="field_f801d7d8-0762-5407-95f9-b8c3a793157c"]
    Click Element  xpath=//*[@id="7026c894-4e85-5e16-910a-b19ca1013c74"]
    Click Element  xpath=//*[@id="container_3fe36edc-80b0-5574-b7ad-7cfe074acfc1"]/label/div/div[1]
    Click Element  xpath=//*[@id="container_5ab6a927-7b72-5869-acc3-0db0858bc495"]/label/div/div[1]
    Click Element  xpath=//*[@id="container_f49b4d08-527e-5edc-9acd-5386bb2e188d"]/label/div/div[1]
    Set Focus To Element    css=#cke_1_contents
    Click Element  css=#cke_1_contents
    Press Keys    css=#cke_1_contents  test
    Set Focus To Element  css=#navButtonNext
    Click Button  css=#navButtonNext

Applicant is able to validate details and send
    Wait Until Page Contains Element    css=#submitButton  10s
    Execute JavaScript  window.scrollTo(0, 1500);
    Wait Until Element Is Enabled    css=#submitButton
    Set Focus To Element  css=#submitButton
    Mouse Over    xpath=//*[@id="projectForm"]/div[2]/div[2]/div[3]/div[2]
    Click Element  xpath=//*[@id="projectForm"]/div[2]/div[2]/div[3]/div[2]

Applicant successfully submits the application
    Wait Until Page Contains    Thank you for submitting your project

Applicant goes back to Home page
    Click Element  xpath=//*[@id="content"]/div/div/div/div/div/a

Applicant is able to submit application 10 times
    FOR    ${counter}    IN RANGE    0    10
        Log    ${counter}
        And Applicant continues to submmit application
        Then Applicant is able to fill out the form
        And Applicant is able to validate details and send
        And Applicant successfully submits the application
        And Applicant goes back to Home page
    END