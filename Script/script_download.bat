@echo off

Set /A Total = 0
for /F "tokens=1,2 delims=;" %%a in (openings_video_list.txt) do (Set /A Total+=1)

setlocal enabledelayedexpansion
Set /A Current = 0
for /F "tokens=1,2 delims=;" %%i in (openings_video_list.txt) do (
if NOT exist %%j (
	echo "%%i;%%j" >> missing.txt
)
)
endlocal

for /F "tokens=1,2 delims=;" %%i in (missing.txt) do (
powershell -Command "(New-Object Net.WebClient).DownloadFile('%%i', '%%j')
)