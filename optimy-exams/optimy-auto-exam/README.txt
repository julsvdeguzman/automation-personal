Pre-requisites:
To be able to run the robot script, the following applications should be available
1. Python - you may dowload from https://www.python.org/downloads/, please include installation of pip and updating PATH for easier installation of libraries
2. Robot Framework - access CMD and run pip install robotframework
3. Selenium2Library - access CMD and run pip install robotframework-selenium2library
Optional: Pycharm IDE - you may use this and download from https://www.jetbrains.com/pycharm/download/?section=windows

Steps to Run Automation Script
1. Download files from repo and save it to your desired location
2. Open CMD and go to the location where you have saved the files
3. You may use the following commands to run the scripts via CMD
   a. To execute test case 1 only (Verify successful submission of a new application)
	 robot --include submit_once optimy-automation-tester.robot
   b. To execute test case 2 only (Verify successful submission of a new application is rerunnable for 10 times)
	 robot --include submit_ten_times optimy-automation-tester.robot
   c. To execute both test cases at the same time
	 robot optimy-automation-tester.robot
Note: You may also run the scripts via the Pycharm IDE. 


