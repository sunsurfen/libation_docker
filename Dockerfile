FROM ghcr.io/linuxserver/webtop:ubuntu-xfce
ARG APP_VERSION=11.0.0

EXPOSE 3000
VOLUME /config/libation

# Download and install Libation
ADD https://github.com/rmcrackan/Libation/releases/download/v${APP_VERSION}/Libation.${APP_VERSION}-linux-chardonnay-amd64.deb /libation.deb
RUN apt install /libation.deb

# Make sure file encoding will be set to UTF-8. 
COPY --from=debian:9.11 /usr/lib/locale /usr/lib/locale

COPY startwm.sh /defaults/startwm.sh

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libgtk-3-bin ca-certificates wget libswt-webkit-gtk-4-jni vim xdg-utils libnss3-dev && \
    apt remove -y xfce4-panel firefox
