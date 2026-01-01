FROM quay.io/fedora/fedora-toolbox:43@sha256:acdcab6a41e1971e25c356bc255b11acf2c179ec0f7ee3181715a232d0abdd86

RUN <<EORUN
set -euxo pipefail

sed -i "s/enabled=1/enabled=0/" "/etc/yum.repos.d/fedora-cisco-openh264.repo"

dnf -y install --setopt=install_weak_deps=False \
	dnf-plugins-core \
	pinentry

dnf -y install --setopt=install_weak_deps=False \
    just \
    btop

EORUN
