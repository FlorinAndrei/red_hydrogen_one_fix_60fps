@echo off

if "%~1"=="" (goto usage) else (goto execute)
:usage
echo Usage: %0 "C:\path\to\file"
GOTO:EOF

:execute
mp4box -add %1#video -raw 1 -new video
mp4box -add video_track1.h264:fps=60 -new video_%1
mp4box -add %1#audio %1.m4a
ffmpeg -i %1.m4a -filter:a "asetrate=r=48K" -vn audio_%1.m4a
::ffmpeg -i %1.m4a -af asetrate=24000*2.0,aresample=24000 -vn audio_%1.m4a
mp4box -add video_%1 -add audio_%1.m4a new_%1
