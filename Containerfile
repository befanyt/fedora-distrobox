FROM quay.io/fedora/fedora-toolbox:43@sha256:0792450948fe2a4b820465fa5524d9cd4f997f42d74f9dfd9f5d2f62723713c7

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
