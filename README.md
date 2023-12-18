# Sauce Labs Automation Testing
System testing on Sauce Labs demo website https://www.saucedemo.com/ using Robot Framework.

## Getting Started

In case you're still new in scripting using Robot Framework, you can follow these instructions until you can execute it on your own local machine.

### Prerequisites

You need to install these before moving to the next step:
1. Python
2. RobotFramework
3. SeleniumLibrary
4. Browser Driver
5. Git (Optional)

### Installing

Start with installing Python in your local. You follow the steps [here](https://www.geeksforgeeks.org/how-to-install-python-on-windows/).

Then, use the package manager [pip](https://pip.pypa.io/en/stable/) to [install RobotFramework](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions). Use this command in your command prompt:

```bash
pip install robot-framework
```

Then put this command to check whether RobotFramework already installed:

```bash
robot --version
```

Since my script are mostly using [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/), you need to install the library first:

```bash
pip install --upgrade robotframework-seleniumlibrary
```

To easily manage all of our [browser driver](https://robotframework.org/SeleniumLibrary/#toc-entry-4), I suggest you to install [WebDriverManager](https://github.com/MarketSquare/webdrivermanager) by entering this command:

```bash
pip install webdrivermanager 
```

Then put this command and adjust it to your need:

```bash
webdrivermanager firefox chrome --linkpath /usr/local/bin
```

Installing git is optional, you can follow the steps [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Execute the scripts

I'm using [argument file](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#toc-entry-440) to execute the robot scripts. It's easier to maintain and select certain tests rather than execute it directly in command prompt. After all prerequisites are installed, go to your lolca directory and put this command:

```bash
robot --argumentfile '.\Argument Files\argfile-trial.txt'
```
And that's it! You can check the result under Test Result folder and go check on the test log or report to se the details.

## Author

**Yudistryan Izhar** - You can contact me via [LinkedIn](https://www.linkedin.com/in/yudistryan/) if you have anything to be discussed.
