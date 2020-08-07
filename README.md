# BPDTS API Test Assignemnt

Robot Framework has been used to create simple Test framework to cover three API Tests : /users, /user/{id}, & /city/{city}/users for Base URL : http://bpdts-test-app-v2.herokuapp.com/

# Rational for using Robot Framework

API Test Automation can be done through Cucumber + RestAssured/TestNG, JavaScript & Python scripts using HTTP Request & JSON Object Library functions however used Robot framewrk for automnation here as Robot Framework is keyword driven development framework and standard keywords available in RequestsLibrary & In-built Library provides wide range of standard keywords based function which can be used to Automate API Tests with minimal code.
The troubleshooting and reporting structure is also quite detailed and can be implemented through out of the box feature to maintain test suites and test case level logs.

Line of code and dependencies are also quite minimal compared to any other API Testing framework and Inheritance from python makes it really fast to execute test and generate detailed summry reports & execution logs through inbuilt Python API calls.

Robot Framework is open source and have wide user base which makes it quite attractive to use, In addition to that the Extensive list of In-built and external libraries (selenium, HttpRequests, Appium, ssh & etc) supported by Robot makes it smartest framwork to Automate any Web, API, Mobile, Desktop App and Infrastructure Testing.

# Minimum requirement

1. Python Versions/2.7 or Versions/3.0 or any higher latest version

2. robotframework-requests library installation (steps to install the same given in Usage steps) 


# Usage

Install robotframework-requests and it's dependencies via ``pip``

```bash
pip install robotframework-requests
```

Here is a description of Tests Automated:

1. TC_01_List of Users Check : /users

Checks performed: Success Response, Response length and Header values

2. TC_02_Valid User Search by Given User ID : /user/{id}

Checks performed: Success Response, Response values (first_name & last_name for searched Id) and Header values

3. TC_03_Invalid User Search by Given Invalid/Missing User ID : /user/{id}

Checks performed: Failed Response, Response code : 404 and Header values

4. TC_04_List of Users Check for Given Valid City : /city/{city}/users

Checks performed: Success Response, Response Body Should not be Empty, Response value (number of expected users for the searched valid city) and Header values

5. TC_05_List of Users Check for Given Invalid/Missing City : /city/{city}/users

Checks performed: Success Response, Empty Response Body (as Invalid/Missing city searched) and Header values


# Documentation

Refer Folder : src/test

Test file: test_assignment.robot

Report/Logs: report.html, log.html & output.xml

Steps to Execute:

After having Python and robotframework-requests lib installed navigate to the folder where test is dowloaded & open terminal and run below command to run robot test file.

-≥ robot test_assignment.robot ≤Enter≥

Wait for test to be completed and navigate to folder where test file was located and verify detailed output, log and test summary reports in html & xml formats.

For individual keyword documentation see the following:

[Keywords documentation](http://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)

# Help

Send your questions to the
- [rudraksh awasthy - rudraksh_awasthy@yahoo.com]

Refer standard Robot Framework documentation 	
- [https://robotframework.org/#documentation]



