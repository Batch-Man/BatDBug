
# BatDBug - by Kvc
## Description
This program can help you to quickly find the bug in the batch program. It will save your time, so that you can create more innovative projects in that time.

Author: Kvc

## Usage
Call BatDBug [File]

Where:

- `ver`		: 	Displays version of program
- `help`		: 	Displays help for the program
- `File`	: 	File to debug

Example: 
`call BatDBug "MyBatchFile.bat"`

## Demonstration
To demonstrate this plugin l have used a simple batch program to find greater of two numbers. As you can see in the code below that I have not used the parenthesis in the IF block of code which is a syntax error in batch programming. 

<!-- wp:code -->
<pre class="wp-block-code"><code>@echo off
SetLocal EnableDelayedExpansion

Set _A=30
set _B=20

IF %_A% GTR !_B! 
	Echo "A is greater"
else (
	Echo "B is greater"
)

pause &gt; nu
Goto :EOF</code></pre>
<!-- /wp:code -->

Now if you try to run the above code in CMD it will tell you that the syntax is incorrect as shown below. To correct this error you have to check every line for syntax errors as CMD doesn't tell us where the error has occurred. 

![image](https://user-images.githubusercontent.com/82807654/182632527-4140c43b-c5ab-44a7-b401-048ced1e0cfb.png)

This is where BatDBug makes the change if you run the same batch program with BatDBug in CMD. It will not only tell you if there is an error or not it will also tell you in which line the error resides which will save a lot of users time in debugging the programs. Below is how the BatDBug plugin will show the error in the batch program. BatDBug runs the program one line at a time while also checking for errors at the same time.

![batdbug1](https://user-images.githubusercontent.com/82807654/182632963-c0c91b99-6f85-4ae4-8142-189d0ce46ff7.gif)

If you run a batch program after removing the error in the program it will run while checking for errors in one line at a time. If no errors are found it will execute the program displaying the output of the code. Below is how BatDBug will execute the above Batch program if it has no errors in it.

![batdbug2](https://user-images.githubusercontent.com/82807654/182633035-66e8e365-07e8-416d-af0e-ac67286d8f8d.gif)


**Video-** https://www.youtube.com/watch?v=qR84LdiZd5c 

**Article-** https://batch-man.com/batdbug/
