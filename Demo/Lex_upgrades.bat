@Echo off
SetLocal EnableDelayedExpansion


:Main
Set _A=1
Set _B=2

IF %_A% GTR !_B!
    Echo "A is greater than B" 
    Echo "A is greater than B"
ELSE
    Echo "A is not greater than B"

IF %_A% GEQ !_B! (
    Echo "A is greater than or equal to B"
    Echo "A is greater than or equal to B"
) ELSE (
    Echo "A is not greater than or equal to B"
)

Set _A=Kvc
Set _B=Groophy

IF "!_A!" NEQ "!_B!" (
    Echo "A is less than B"
    Echo "A is less than B"
    ) ELSE (
    Echo "A is not less than B"
    )
sss
Goto :help
pause
Goto :EOF

