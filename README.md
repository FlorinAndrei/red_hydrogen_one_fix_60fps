# red_hydrogen_one_fix_60fps
Fix the 60fps frame rate for the RED Hydrogen One smartphone

The Hydrogen One smartphone by RED (red.com) is pretty awesome in every way, except for the rear camera video settings.

It can shoot 60fps just fine, but the video files are only saved with a time base of 30 fps - so they are played in slow motion. You need to fix the time base and re-code the audio track to make them actually playable in 60 fps. :(

I made a script that de-muxes the files, extracts the video and audio tracks, re-encodes the audio track to compress its length 2x, while raising its pitch 2x, then muxes the video and audio in an MP4 container with a declared time base of 60 fps. The video track is not re-encoded at all, it's just re-muxed at a different declared frame rate.

You must configure your RED camera app to shoot 60 fps, with a time base of 30 fps, using the H.264 codec, in order for this script to work properly. Works with 1080p and 1440p video. No support for H.265 yet.

Just run the script with the video file name as a parameter. The fixed video file will have the `new_` prefix added to its name.

The script requires mp4box and ffmpeg.

Tested on Windows 10.
