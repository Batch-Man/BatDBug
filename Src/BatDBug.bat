@Echo off
SetLocal EnableDelayedExpansion
Mode 80,25

Set "Path=%Path%;%cd%;%cd%\Files;"

REM THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY
REM KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
REM WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
REM AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
REM HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
REM WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
REM DEALINGS IN THE SOFTWARE.

REM This program is distributed under the following license:

REM ================================================================================
REM GNU General Public License (GPL) - https://opensource.org/licenses/gpl-license
REM ================================================================================


REM ================= ABOUT THE PROGRAM =================
REM This program is created by Kvc at '17-04-2022 - 13:44'
REM This program can help in quickly finding the bug in the batch program.
REM For More Visit: www.batch-man.com


REM Setting version information...
Set _ver=20220417


REM Checking for various parameters of the function...
If /i "%~1" == "/?" (goto :help)
If /i "%~1" == "--help" (goto :help)
If /i "%~1" == "-h" (goto :help)
If /i "%~1" == "-?" (goto :help)
If /i "%~1" == "-help" (goto :help)

If /i "%~1" == "ver" (Echo.%_ver%&Goto :End)
If /i "%~1" == "" (goto :help)

REM Saving parameters to variables...
Set _1=%~1

REM Starting Main Program...
:Main
REM Count the number of lines in the file
Set _Lines=0
For /f "tokens=1,2*" %%i in ('WC -l ^"%~1^"') do (Set _Lines=%%i)
Echo. Number of lines in the file: !_Lines!
Echo.
Echo. Starting the Debugging process...
Echo.
Call Progress 75 0 !_Lines!
Copy /Y "%~1" "!temp!\Copy_%~nx1" 2>nul >nul
Set /A _Lines*=2
For /L %%A in (1,2,!_Lines!) do (
    Call Progress 75 %%A !_Lines!
    Set /A _TempLine=%%A/2
    AddLine "!temp!\Copy_%~nx1" "%%A" "@gecho """^<dy^>Line [^<Gn^>!_TempLine!^<dy^>] - ^<b^>ERRORLEVEL^=^<r^>%%ERRORLEVEL%%^<dgy^>""""
    )
)
Echo.
AddLine "!temp!\Copy_%~nx1" "1" "@Set """Path=%Path%;%cd%;""""
Start /Wait /I "BatDBug - Debugging" "!temp!\Copy_%~nx1"
Goto :End

:End
Goto :EOF

:Help
Echo.
Echo. This function will help you to quickly find the bug in the batch program.
echo. It will save your time, so that you can create more innovative projects in 
echo. that time.
Echo. CREDITS: BatDBug v%_ver% by Kvc
echo.
echo. Syntax: call BatDBug [File]
echo. Syntax: call BatDBug [help , /? , -h , -help]
echo. Syntax: call BatDBug ver
echo.
echo. Where:-
echo.
echo. ver		: Displays version of program
echo. help		: Displays help for the program
echo. [File]		: File to debug
Echo.
Echo. Example: Call BatDBug "MyBatchFile.bat"
Echo. Example: Call BatDBug ver
Echo. Example: Call BatDBug [/? , -h , -help , help]
Echo.
Echo.
Echo. PLUGINS REQUIRED FOR THIS PROJECT:
Echo. Wc        by Paul Rubin and David MacKenzie master
Echo. gecho     by GroophyLifefor
Echo. Progress  by Kvc
Echo. AddLine   by Kvc
Echo. 
Echo. www.batch-man.com
Echo. #batchman
Goto :End

