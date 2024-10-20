@echo off
set pypath=home = %~dp0python
set venvpath=_ENV=%~dp0venv
if exist venv (powershell -command "$text = (gc venv\pyvenv.cfg) -replace 'home = .*', $env:pypath; $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False);[System.IO.File]::WriteAllLines('venv\pyvenv.cfg', $text, $Utf8NoBomEncoding);$text = (gc venv\scripts\activate.bat) -replace '_ENV=.*', $env:venvpath; $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False);[System.IO.File]::WriteAllLines('venv\scripts\activate.bat', $text, $Utf8NoBomEncoding);")

for /d %%i in (tmp\tmp*,tmp\pip*) do rd /s /q "%%i" 2>nul || ("%%i" && exit /b 1) & del /q tmp\tmp* > nul 2>&1 & rd /s /q pip\cache 2>nul

set appdata=tmp
set userprofile=tmp
set temp=tmp
set PATH=git\cmd;python;venv\scripts;ffmpeg;venv\Lib\site-packages\torch\lib;tensorrt;tensorrt\lib;tensorrt\bin

set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.8,max_split_size_mb:512
set CUDA_MODULE_LOADING=LAZY
set CUDA_PATH=venv\Lib\site-packages\torch\lib

call venv\Scripts\activate.bat
echo " ____                     _ "
echo "|  _ \                   (_)"
echo "| |_) |  ___  _ __   ____ _ "
echo "|  _ <  / _ \| '_ \ |_  /| |"
echo "| |_) ||  __/| | | | / / | |"
echo "|____/  \___||_| |_|/___||_|"
echo "DeepLiveMini.V10.24 - Updated on 2024.10.20
echo "Telegram:@Benzi_tools
python start.py --execution-threads 8 --execution-provider cpu --max-memory 16
pause

