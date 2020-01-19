echo -n performance | tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
mount -o remount,size=128M /dev/shm
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket 
jackd -P70 -p16 -t2000 -d alsa -p 256 -n 3 -r 48000 -s &
sleep 10
zita-n2j --buff 15 0.0.0.0 4343 &
sleep 1
jack_connect zita-n2j:out_1 system:playback_1
jack_connect zita-n2j:out_2 system:playback_2
wait
