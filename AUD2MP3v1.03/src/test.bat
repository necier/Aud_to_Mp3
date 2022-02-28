@echo off
format %1
chcp 65001
cd ..
set home=%cd%
cd src
set into=%cd%
md tmpForPCM
for /r %1 %%i in (*.aud) do (
silk_v3_decoder.exe %%i "%into%\tmpForPCM\%%~ni.pcm"
ffmpeg -y -f s16le -ar 24000 -threads 6 -ac 1 -loglevel quiet -i "%into%\tmpForPCM\%%~ni.pcm" "%home%\mp3\%%~ni.mp3"
)
rd /s /q "%into%\tmpForPCM"

