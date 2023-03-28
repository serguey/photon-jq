# syntax = docker/dockerfile:1.4
FROM photon:4.0
CMD ["/bin/bash"]
LABEL maintainer="Sergey Kutovoy <ya.serguey@yandex.ru>"
LABEL org.opencontainers.image.authors="ya.serguey@yandex.ru"
LABEL description="VMware Photon OS based image with curl and jq"

# Utility packages
ENV container=docker
RUN <<EOF
	set -xe
	mkdir -p /run/systemd && echo 'docker' > /run/systemd/container
	echo "UTC" > /etc/timezone
	tdnf -q -y update && tdnf -q -y install less jq nano iputils iproute2
	rm -rf /var/cache/tdnf/*
EOF

WORKDIR /
LABEL version="1.2"
