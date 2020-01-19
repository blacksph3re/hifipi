#!/bin/bash

ulimit -l 1024
zita-j2n hifipi 4343 &
sleep 2
jack_connect "PulseAudio JACK Sink:front-left" zita-j2n:in_1
jack_connect "PulseAudio JACK Sink:front-right" zita-j2n:in_2
wait

