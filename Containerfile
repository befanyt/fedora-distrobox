FROM quay.io/fedora/fedora-toolbox:43@sha256:0c9333eab94588a51927e3a426378d4cfcf389529813f8605de95c59ea95ce35

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
