FROM quay.io/fedora/fedora-toolbox:43@sha256:2e25986bc3c5408bb7214c4457d7b40023cf30e337611d6192c89f1075f072c0

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
