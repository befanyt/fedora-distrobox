FROM quay.io/fedora/fedora-toolbox:43@sha256:a199e5a0e396b96d483ea1ea9c1b1231a83060e6dabe2748bebf6d0bff105ed5

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
