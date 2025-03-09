@echo off
:: Prompt the user to enter the URL for the file to download
set /p download_url=Please enter the URL to download: 

:: Specify the output file name (optional, defaults to the name of the file in the URL)
set /p output_file=Enter output file name (leave empty to use default name): 

:: Check if curl is installed
curl --version >nul 2>&1
if %errorlevel% neq 0 (
    echo curl is not installed on this system. Please install it first.
    pause
    exit /b
)

:: Use curl to download the file
if "%output_file%"=="" (
    curl -O "%download_url%"
) else (
    curl -o "%output_file%" "%download_url%"
)

:: Notify the user and exit
if %errorlevel%==0 (
    echo Download successful!
) else (
    echo Download failed. Please check the URL and try again.
)
pause
