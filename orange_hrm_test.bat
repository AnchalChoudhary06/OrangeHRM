@echo off
SET BASE_DIR=C:\Users\Signity\Desktop\Project_Jmeter\OrangeHRM

:: Clean old HTML report folder
IF EXIST "%BASE_DIR%\HTMLReports" (
  rmdir /S /Q "%BASE_DIR%\HTMLReports"
)

echo ------------------------------------------
echo Starting OrangeHRM JMeter Test Execution...
echo Base Directory: %BASE_DIR%
echo ------------------------------------------

jmeter -n ^
  -t "%BASE_DIR%\TestPlan\orangehrm_test.jmx" ^
  -p "%BASE_DIR%\Config\userOrangeHRM.properties" ^
  -l "%BASE_DIR%\Result\orangehrm.csv" ^
  -j "%BASE_DIR%\Logs\log" ^
  -e ^
  -o "%BASE_DIR%\HTMLReports"

echo ------------------------------------------
echo Test Execution Completed.
echo Report generated in: %BASE_DIR%\HTMLReports
echo ------------------------------------------
pause
