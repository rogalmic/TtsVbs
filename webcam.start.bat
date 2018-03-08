REM https://wiki.videolan.org/Documentation:Modules/mosaic/
@setlocal
@set CurrentPath=%~dp0
@cd "%CurrentPath%"

start "" "C:\Program Files (x86)\VideoLAN\VLC\vlc.exe" --intf dummy --vlm-conf .\webcams.vlm.conf --mosaic-width=1280 --mosaic-height=720 --mosaic-keep-picture --mosaic-rows=2 --mosaic-cols=2  --mosaic-order=1,2,3,4 --image-duration=-1 
@endlocal
