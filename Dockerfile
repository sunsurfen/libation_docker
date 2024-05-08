# syntax=docker/dockerfile:1.6-labs

ARG GIT_TAG=${GIT_TAG:-11.1.0}

FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm as base

ARG GIT_TAG

ENV PUID=${PUID:-1000} \
    PGID=${PGID:-1000}

COPY /root /

RUN echo fs.inotify.max_user_instances=524288 | tee -a /etc/sysctl.conf && \
    curl -fSL https://github.com/rmcrackan/Libation/releases/latest/download/Libation.${GIT_TAG}-linux-chardonnay-amd64.deb --output libation.deb && \
    dpkg -i libation.deb || apt-get install -f && \
    apt-get update && \
    apt-get install -y \
    libgtk-3-0 && \
    rm -rf /var/lib/apt/lists/* && \
    rm libation.deb && \
    curl -fSL https://raw.githubusercontent.com/rmcrackan/Libation/master/Source/LoadByOS/LinuxConfigApp/libation_glass.svg --output /usr/share/icons/hicolor/scalable/apps/libation.svg && \
    mkdir /config/Books && \ 
    chown -R 1000:1000 /config/Libation /config/Books && \
    ln -s /config/Books /
