FROM debian:stretch

# Install dependencies
RUN apt update && apt -y install libssl1.1 libboost-thread1.62.0 libboost-system1.62.0 libcurl3

# Clean
RUN apt clean
RUN rm -rf /var/lib/apt/lists/*

# Get Domoticz
ADD https://releases.domoticz.com/releases/release/domoticz_linux_x86_64.tgz /opt/
RUN mkdir /opt/domoticz
RUN tar xfv /opt/domoticz_linux_x86_64.tgz -C /opt/domoticz

# Prepare directories
RUN mkdir /config

# Volume
VOLUME /config

# Ports
EXPOSE 8080

# Command
CMD ["/opt/domoticz/domoticz", "-www", "8080", "-sslwww", "0", "-dbase", "/config/domoticz.db", "-log", "/config/domoticz.log"]
