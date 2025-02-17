#!/usr/bin/env bash

./bin/docker_run.sh python video.py --input_file videos/FRIENDS.mp4 --output_file videos/FRIENDS_blur-str05.mp4 --cpu --blur_strength 0.5

retVal=$?
if [ $retVal -ne 0 ]; then
    echo "!!!"
    echo "!!! video file not processed correctly => manually check what happened !!!"
    echo "!!!"
fi
exit $retVal

# Remark: we may want to recode the resulting video file using ffmpeg to reduce the file size and change the codec.
#
# ./bin/docker_run.sh ffmpeg -i input.mp4 -vcodec libx264 -crf 23 output.mp4
#
# libx265 is also possible but is slower to process and gives a larger file
# 
# meaning of -crf factor in ffmpeg (https://superuser.com/questions/677576/what-is-crf-used-for-in-ffmpeg): 
# crf = Constant Rate Factor 
# The range of the quantizer scale is 0-51: where 0 is lossless, 23 is default, and 51 is worst possible. 
# A lower value is a higher quality and a subjectively sane range is 18-28. 
# Consider 18 to be visually lossless or nearly so: it should look the same or nearly the same as the 
# input but it isn't technically lossless.
#
# crf 18 in h264 almost doubles the file size compared to crf 23 in h264 
#
