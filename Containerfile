FROM quay.io/fedora/fedora-toolbox:43@sha256:496a87d3919e15c296ce0ba7c10d6fb31a86d4d8bdc70a93bdeececea031ac1d

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
