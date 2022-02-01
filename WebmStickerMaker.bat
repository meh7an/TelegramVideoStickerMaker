@WHERE ffmpeg
@IF %ERRORLEVEL% NEQ 0 (
@ECHO FFMPEG is not available in the path. Please install it properly first.
@PAUSE
@EXIT /B
)
@for %%f in (*.mp4 *.mov *.avi *.flv *.mkv) do ffmpeg.exe -i %%f -c:v libvpx-vp9 -vf scale=512:512 -an %%f_Sticker.webm -hide_banner -loglevel error
@ECHO All videos are converted to stickers.
@PAUSE
