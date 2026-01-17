FROM quay.io/fedora/fedora-toolbox:43@sha256:948ba251e8f74681594376eaf880b30264f6b50786e56d6d0dc0246ed9c1b8b3

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
