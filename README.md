# BPDTS API Test Assignemnt

Robot Framework has been used to create simple Test framework to cover three API Tests : /users, /user/{id}, & /city/{city}/users

# Minimum requirement

1.Python Versions/2.7 or Versions/3.0 or any higher latest version
2.robotframework-requests library installation (steps to install the same given in Usage steps) 


# Usage

Install robotframework-requests and it's dependencies via ``pip``

```bash
pip install robotframework-requests
```

Here is a description of Tests Automated:

1. TC_01_List of Users Check : /users
Checks performed: Success Response, Response length and Header values validated

2. TC_02_Valid User Search by Given User ID : /user/{id}
Checks performed: Success Response, Response values (first_name & last_name for searched Id) and Header values validated

3. TC_03_Invalid User Search by Given Invalid/Missing User ID : /user/{id}
Checks performed: Failed Response, Response code : 404 and Header values validated

4. TC_04_List of Users Check for Given Valid City : /city/{city}/users
Checks performed: Success Response, Response Body Should not Empty, Response value (number of expected users for the searched valid city) and Header values validated

5. TC_05_List of Users Check for Given Invalid/Missing City : /city/{city}/users
Checks performed: Success Response, Empty Response Body (as Invalid/Missing city searched) and Header values validated

Please note same Automation can be done through Cucumber + RestAssured/TestNG and Python scripts using HTTP Request Library functions however you can see through Robot Framework we can used standard keywords available in RequestsLibrary and In-built troubleshooting and reporting structure is detailed and can be used as out of the box feature to maintain test suite and test case level logs.

Line of code and dependencies are quite minimal compared to any other framework used for API Testing.

# Documentation

Refer Folder : src/test
Test file: test_assignment.robot
Report/Logs: report.html, log.html & output.xml

Steps to Execute:

After having Python and robotframework-requests install navigate to the folder where test is dowloaded and open terminal and run below command to run robot test file.
-≥ robot test_assignment.robot ≤Enter≥
Wait for test to be completed and native to folder where test file was located and verify detailed output, log and reports in html & xml formats.

For individual keyword documentation see the following:

[Keywords documentation](http://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)

# Help

Send your questions to the
- [rudraksh awasthy - rudraksh_awasthy@yahoo.com]

Refer standard Robot Framework documentation 	
- [https://robotframework.org/#documentation]



