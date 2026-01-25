FROM quay.io/fedora/fedora-toolbox:43@sha256:72bcc32b8548ffcfcf836e52b6b96e6d925ad797d8b71e5d4cca052615c5b7a0

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
