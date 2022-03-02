@echo off
title SycerNetwork-Lite Download Youtube
:End

if exist youtube-dl.exe (
    echo CheckFile There is a program youtube-dl.exe.
) else (
    echo There is no program youtube-dl.exe Download.
    powershell -Command "Invoke-WebRequest https://youtube-dl.org/downloads/latest/youtube-dl.exe -OutFile youtube-dl.exe"
    cls
    echo CheckFile There is a program youtube-dl.exe.
)

echo ===========================
echo SycerNetwork-Lite Download Youtube
echo For No
echo 1 Chack
echo 2 Download MP4
echo 3 Download MP3
echo ===========================
echo Import Text
set /p url=Url : 
set /p no=No : 
IF %no% ==1 GOTO Label1
IF %no% ==2 GOTO Label2
IF %no% ==3 GOTO Label3


cls
echo Error
color 0e
set /p exit=Exit y/n : 

:Label1
echo %url%
youtube-dl.exe -F %url%
set /p exit=Exit y/n : 
IF %exit% ==y exit
IF %exit% ==n GOTO End

:Label2
echo ===========================
echo Download
echo %url%
youtube-dl.exe --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 %url%
echo ===========================
set /p exit=Exit y/n : 
IF %exit% ==y exit
IF %exit% ==n GOTO End

:Label3
echo ===========================
echo Download
echo %url%
youtube-dl.exe -x --audio-format mp3 --encoding utf8 %url%
echo ===========================
set /p exit=Exit y/n : 
IF %exit% ==y exit
IF %exit% ==n GOTO End
