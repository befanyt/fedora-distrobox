FROM quay.io/fedora/fedora-toolbox:43@sha256:6d09ad9a2d08973fcea5ef67ac509fe6fc6b34f6420693a6e06708244c33fa43

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
