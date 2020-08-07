*** Settings ***
Documentation     Simple API Test Implementation with Robot Framework for Get Operations
Library               Collections
Library               RequestsLibrary

*** Variables ***
${BASE URL}      http://bpdts-test-app-v2.herokuapp.com
${VALID USER}      222
${INVALID USER}      007
${VALID CITY}      London
${INVALID CITY}      Bangalore

*** Test Cases ***
TC_01_List of Users Check : /users
    Create Session    bpdts         ${BASE URL}
    ${resp}=          Get Request    bpdts              /users
    Request Should Be Successful     ${resp}
    Status Should Be  200            ${resp}
    Should Not Be Empty  ${resp.json()}
    ${len}=           Get Length  ${resp.json()}
    Should Be Equal As Numbers           ${len}    1000   # Total Users check
    Log to console   ${resp.json()}

TC_02_Valid User Search by Given User ID : /user/{id}
    Create Session    bpdts         ${BASE URL}
    ${resp}=          Get Request    bpdts              /user/${VALID USER}
    Request Should Be Successful     ${resp}
    Status Should Be  200            ${resp}
    Should Be Equal As Strings           ${resp.json()['first_name']}    Norrie   #User Id : 222 first_name verification
    Should Be Equal As Strings           ${resp.json()['last_name']}    Worthington   #User Id : 222 last_name verification
    Log to console   ${resp.json()}
      # Header verification
    Should Be Equal As Strings           ${resp.headers['connection']}    keep-alive
    Should Be Equal As Strings           ${resp.headers['content-type']}    application/json
    Should Be Equal As Strings           ${resp.headers['server']}    gunicorn/19.9.0
    Should Be Equal As Strings           ${resp.headers['via']}    1.1 vegur
    Log to console   ${resp.headers}

TC_03_Invalid User Search by Given Invalid/Missing User ID : /user/{id}
    Create Session    bpdts         ${BASE URL}
    ${resp}=          Get Request    bpdts              /user/${INVALID USER}
    Status Should Be  404            ${resp}  # Invalid user Id: 007 should return 404 hence validated the same
    Log to console   ${resp.json()}
      # Header verification
    Should Be Equal As Strings           ${resp.headers['connection']}    keep-alive
    Should Be Equal As Strings           ${resp.headers['content-type']}    application/json
    Should Be Equal As Strings           ${resp.headers['server']}    gunicorn/19.9.0
    Should Be Equal As Strings           ${resp.headers['via']}    1.1 vegur
    Log to console   ${resp.headers}

TC_04_List of Users Check for Given Valid City : /city/{city}/users
    Create Session    bpdts         ${BASE URL}
    ${resp}=          Get Request    bpdts              /city/${VALID CITY}/users
    Request Should Be Successful     ${resp}
    Status Should Be  200            ${resp}
    Should Not Be Empty  ${resp.json()}      # Users list for Valid city : London should not be Empty
    ${len}=           Get Length  ${resp.json()}
    Should Be Equal As Numbers           ${len}    6   # Number of Users check for Valid City : London
    Log to console   ${resp.json()}
      # Header verification
    Should Be Equal As Strings           ${resp.headers['connection']}    keep-alive
    Should Be Equal As Strings           ${resp.headers['content-type']}    application/json
    Should Be Equal As Strings           ${resp.headers['server']}    gunicorn/19.9.0
    Should Be Equal As Strings           ${resp.headers['via']}    1.1 vegur
    Log to console   ${resp.headers}

TC_05_List of Users Check for Given Invalid/Missing City : /city/{city}/users
    Create Session    bpdts         ${BASE URL}
    ${resp}=          Get Request    bpdts              /city/${INVALID CITY}/users
    Status Should Be  200            ${resp}
    Should Be Empty  ${resp.json()}   # Users list for Invalid/Missing city : Bangalore should be Empty
    Log to console   ${resp.json()}
      # Header verification
    Should Be Equal As Strings           ${resp.headers['connection']}    keep-alive
    Should Be Equal As Strings           ${resp.headers['content-type']}    application/json
    Should Be Equal As Strings           ${resp.headers['server']}    gunicorn/19.9.0
    Should Be Equal As Strings           ${resp.headers['via']}    1.1 vegur
    Log to console   ${resp.headers}
