FROM quay.io/fedora/fedora-toolbox:43@sha256:20f9523f6cc2afe3d414a9eb4199cfedf6c1f3f68b35950134d6cac0318e6ebe

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
