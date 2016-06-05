#!/bin/bash

gst-launch-1.0 -e -v  udpsrc port=5000 \
    caps="application/x-rtp,media=(string)video,clock-rate=(int)90000,encoding-name=(string)H264" \
    ! rtph264depay ! decodebin ! autovideosink
exit

#gst-launch-1.0 -e -v udpsrc port=5000 \
#    ! gdpdepay ! rtph264depay ! avdec_h264 ! fpsdisplaysink
#autovideosink sync=false
exit
gst-launch-1.0 -e -v udpsrc port=5000 \
    ! application/x-rtp, clock-rate=90000,payload=96 \
    ! rtpjitterbuffer \
    ! rtph264depay \
    ! avdec_h264 \
    ! fpsdisplaysink
