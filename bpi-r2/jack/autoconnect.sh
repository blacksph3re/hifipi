while true
do
	sleep 10
	(jack_connect "PulseAudio JACK Sink:front-left" system:capture_1 > /dev/null 2>&1 || true)
	(jack_connect "PulseAudio JACK Sink:front-right" system:capture_2 > /dev/null 2>&1 || true)
done
