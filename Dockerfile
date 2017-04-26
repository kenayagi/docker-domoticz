FROM debian:jessie

# Install dependencies
RUN apt-get update && apt-get -y install libssl1.0.0 libboost-thread1.55.0 libboost-system1.55.0 libcurl3

# Clean
RUN rm -rf /var/lib/apt/lists/*

# Get Domoticz
ADD https://codeload.github.com/domoticz/domoticz/tar.gz/3.5877 /opt/
RUN mkdir /opt/domoticz
RUN tar xfv /opt/domoticz-3.5877.tar.gz -C /opt/domoticz

# Prepare directories
RUN mkdir /config

# Volume
VOLUME /config

# Ports
EXPOSE 8080

# Command
CMD ["/opt/domoticz/domoticz", "-www", "8080", "-sslwww", "0", "-dbase", "/config/domoticz.db", "-log", "/config/domoticz.log"]
