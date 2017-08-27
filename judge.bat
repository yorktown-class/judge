@echo off

echo "Problem ID:"
set /p div=""
echo "File Name"
set /p nm=""

md tmp
Attrib tmp +h
g++ %nm%.cpp -o tmp\%nm% -Wl,--stack,1024000000

for %%I in (Data\%div%\*.in) do (
	echo -------------------- 
	echo Runing on Test %%~nI
	echo --------------------

	tmp\%nm%  < Data\%div%\%%~nI.in > tmp\test.out

	fc Data\%div%\%%~nI.out tmp\test.out
	if errorlevel == 1 (
		echo GG!!!
		pause
		goto :loop
	)
	echo Accepted Test %%~nI
	echo.
	echo.
	echo.
	echo.
)
echo Accepted!!!
pause
:loop
del tmp\test.out
del tmp\%nm%.exe
Attrib tmp -h
rd tmp