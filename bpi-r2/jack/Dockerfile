FROM ubuntu

RUN apt-get update && apt-get install jackd2 -y
COPY autoconnect.sh autoconnect.sh
CMD (bash autoconnect.sh &) && jackd -r -d netone

