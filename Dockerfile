# Use a base image with a lightweight Linux distribution
FROM ubuntu:22.04.4

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    libgtk2.0-0 \
    libnss3-tools \
    libcanberra-gtk-module \
    libx11-xcb1 \
    libglu1-mesa \
    libxi6 \
    libxrender1 \
    libsm6 \
    libxrandr2 \
    libdbus-glib-1-2 \
    libxtst6 \
    ca-certificates \
    && apt-get clean

# Download and install Fortinet SSLVPN client
RUN curl -O http://path.to/forticlientsslvpn_linux_4.4.2322.tar.gz && \
    tar -xvzf forticlientsslvpn_linux_4.4.2322.tar.gz && \
    rm forticlientsslvpn_linux_4.4.2322.tar.gz

# Make the Fortinet SSLVPN client executable
RUN chmod +x forticlientsslvpn/64bit/forticlientsslvpn

# Set environment variables for VPN credentials
ENV VPN_HOST="cobblestoneenergy.fortiddns.com"
ENV VPN_PORT="10443"
ENV VPN_USER="stephentest"
ENV VPN_PASS="Bod39833"

# Command to run the SSLVPN client with the provided credentials
CMD ["./forticlientsslvpn/64bit/forticlientsslvpn", "--server", "cobblestoneenergy.fortiddns.com:10443", "--vpnuser", "stephentest", "--passwd", "Bod39833"]
