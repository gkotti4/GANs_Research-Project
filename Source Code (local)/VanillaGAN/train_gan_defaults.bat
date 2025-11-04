@echo off
setlocal enabledelayedexpansion

:: Default number of runs (can override by passing a number)
set NUM_RUNS=10
if not "%1"=="" set NUM_RUNS=%1

:: Memory limit
::set MEM_LIMIT=4097152
set SCRIPT=mnist_gan.py

echo Optional Parameters: NUM_RUNS
echo.

echo Running GAN with:
echo  - Memory limit (informational only): %MEM_LIMIT% KB
echo.

for /L %%i in (1,1,%NUM_RUNS%) do (
    echo Run #%%i of %NUM_RUNS%
    
    python %SCRIPT%
    
    echo Run #%%i complete
    timeout /t 0 > nul
)

python run_generator.py

endlocal