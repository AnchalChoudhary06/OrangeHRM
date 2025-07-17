# 🧪 JMeter Test Automation Project

This project contains performance, load, and API test plans designed using **Apache JMeter**. It supports CLI execution, and report generation.

---

## 📁 Project Structure

jmeter-project/\
├── TestPlan/ # .jmx test plan files\
├── Config/ # Property files  configs\
├── Result/ # Raw JTL files and logs\
├── Logs/ # Raw  logs\
├── HTMLReports/ # HTML reports generated at run time after execution\
├── scripts/ # Shell and batch scripts for execution of test plan\
└── README.md # Project documentation

---

## 🚀 How to Run the Tests (CLI Mode)

### Pre-requisites

- JMeter installed and added to your system path
- Java installed (version 8+)

### Example CLI Command

```cmd
jmeter -n \
  -t TestPlan/orangehrm_test.jmx \
  -l Result/orangehrm.jtl \
  -j Logs/orangehrm.log \
  -q Config/userOrangeHRM.properties \
  -e -o HTMLReports
```

### 📌 Generic Command Template

You can use the below command and modify the file paths according to your test structure:

```cmd
jmeter -n \
  -t <path-to-your-jmx-file>/<filename>.jmx \
  -q <path-to-your-properties-file>/<filename>.properties \
  -l <path-to-result-folder>/<result>.jtl \
  -j <path-to-log-folder>/<logfile>.log \
  -e -o <path-to-html-report-folder>/<reportFileName>
```

**🔁 Replace paths and filenames according to your workspace.**

---

## ⚙️ Configurations

You can change the environment settings in:

- Config/userOrangeHRM.properties

```properties
e_NUMBER=334
base_url=https://opensource-demo.orangehrmlive.com/
```

**Please update the **``** when you run the project because employee numbers on the Orange HRM website are auto-deleted after some time. You can find the Employee ID in the API response on the Orange HRM network tab.**

```properties
jmeter.reportgenerator.overall_granularity=60000
jmeter.reportgenerator.apdex_satisfied_threshold=500
jmeter.reportgenerator.apdex_tolerated_threshold=1500
jmeter.reportgenerator.exporters=html
jmeter.reportgenerator.exporter.html.classname=org.apache.jmeter.report.dashboard.HtmlTemplateExporter
```
**Please update the **``** when you run the project if get an issue in report generation and get the apdex_satisfied_thershold issue add the above few line in your .properties file to resolve the Issue.**


---

## 🧪 Test Plans Included

- **Login\_Module**: Simulates user login according to requirements
- **Functional\_Module**: Simulates Search Employee and Update Employee flow
- **Logout\_Module**: Simulates user logout

---

## 📝 scripts/ Directory

This folder contains reusable **batch (**``**) scripts for Windows** and **shell (**``**) scripts for Linux/macOS** to simplify test execution using command-line automation.

### 💡 Why use scripts?

- 🔁 Avoid manually typing long commands
- 🧪 Automate individual or multiple test executions
- ⚙️ Use with Jenkins or other CI/CD tools

### ✅ Examples:

#### `scripts/run_login_test.bat` (Windows)

```bat
@echo off
SET BASE_DIR=C:\Users\Desktop\Project_Jmeter\OrangeHRM

echo Running Login Test...

jmeter -n ^
  -t %BASE_DIR%\TestPlan\orangehrm_test.jmx ^
  -p %BASE_DIR%\Config\userOrangeHRM.properties ^
  -l %BASE_DIR%\Result\orangehrm.csv ^
  -j %BASE_DIR%\Logs\log ^
  -e ^
  -o %BASE_DIR%\HTMLReports

pause
```

#### `scripts/run_login_test.sh` (Linux/macOS)

```bash
#!/bin/bash

BASE_DIR="/Users/yourname/Desktop/Project_Jmeter/OrangeHRM"
echo "Running Login Test Plan on Linux/macOS..."

jmeter -n \
  -t "$BASE_DIR/TestPlan/orangehrm_test.jmx" \
  -p "$BASE_DIR/Config/userOrangeHRM.properties" \
  -l "$BASE_DIR/Result/orangehrm.csv" \
  -j "$BASE_DIR/Logs/log" \
  -e -o "$BASE_DIR/HTMLReports"
```

> ⚠️ Don’t forget to make the `.sh` file executable:
>
> ```bash
> chmod +x scripts/run_login_test.sh
> ```

These scripts allow quick execution without retyping long commands every time and make the project portable and easy to maintain.

---

## 👥 Contributors

- Anchal Choudhary
- Contributors welcome!

