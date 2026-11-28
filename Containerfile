FROM quay.io/fedora/fedora-toolbox:46@sha256:5255069dbd42cb7d1ccb0b1399cce3a76ba5efd88772c27442a3392f55e996fd

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
