# Hifipi

This is a project, where I use my old Raspberry Pi 1 with  the Hifiberry DAC soldered on top as a DAC.

I tried streaming audio via pulseaudio/RTP, but I couldn't get it to low enough latency, I ended up with something around 2 seconds lag - watching a movie with that is terrible.

So I set up Jack as a stack.

## Preparing the pi

Install a headless raspbian, apt install jack2 and zita-njbrigde. I encountered some weird dbus problems, so I had to add `system.conf` to `/etc/dbus-1/system`.


`hifipi.service` goes to `/etc/systemd/system`,
`start_jack.sh` goes to `/home/pi`.

Then start the systemd service, and the Pi should pretty much be set.

## Preparing the laptop

As I wanted to keep using pulseaudio (firefox doesn't really support jack anymore), I had to bridge pulseaudio to jack. In the past I set this up via cli, but I found that cadence can do it in a gui easily. I used that option.

After starting jack, run `start_on_laptop.sh` to start the netbridge from your laptop.

## Tweaking xruns

There are 3 buffers you can tweak, the jack buffer on the laptop, the buffer in zita-n2j and the jack buffer on the pi. I used values on the pi as in the script and a 1024 sample buffer on my laptop. I don't know why I needed such a big buffer here, but whatever. 

The resulting latency is barely noticeable. When playing back both on my laptop speakers and the pi, a minimal delay is noticeable, I guess some 20-30ms. It needs a very musical ear to hear that though.
