@echo off
echo ==================================================
echo Starting DB Exporter ETL Task at %date% %time%
echo ==================================================

cd /d "%~dp0"

node scheduled-etl.js >> etl-schedule.log 2>&1

echo ==================================================
echo DB Exporter ETL Task finished at %date% %time%
echo ==================================================
