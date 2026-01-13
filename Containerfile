FROM quay.io/fedora/fedora-toolbox:43@sha256:985afaef7bf6cfc1163ffa7a25d9ff4a8732eb9438ebcfe327587ab4bcf1d1a0

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
