FROM ubuntu:eoan

RUN apt-get update && apt-get install wget gnupg -y
RUN (wget -q -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -) && wget -q -O mopidy.list https://apt.mopidy.com/buster.list && echo "" >> /etc/apt/sources.list && cat mopidy.list >> /etc/apt/sources.list && apt-get update && apt-get upgrade -y && apt-get install pulseaudio-module-jack build-essential python3-pip python3-dev mopidy mopidy-spotify mopidy-soundcloud -y
RUN python3 -m pip install Mopidy-MusicBox-Webclient Mopidy-Mobile  
COPY mopidy.conf /etc/mopidy/mopidy.conf
COPY default.pa /etc/pulse/default.pa

CMD pulseaudio -D && mopidy --config=/etc/mopidy/mopidy.conf
