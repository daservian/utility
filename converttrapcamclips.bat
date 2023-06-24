@echo off
setlocal enabledelayedexpansion

for %%i in (*.avi) do (
    set "input=%%i"
    set "output=!input:.avi=.mp4!"
    ffmpeg -i "!input!" -c:v libx264 -crf 18 -preset slow -c:a aac -b:a 192k -vf "scale=1920:1080" -pix_fmt yuv420p -movflags +faststart "!output!"
)

endlocal