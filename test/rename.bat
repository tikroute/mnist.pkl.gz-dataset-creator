@echo off
setlocal enabledelayedexpansion
for %%a in ("* *") do (
  set "file=%%a"
  ren "%%a" "!file: =_!"
)