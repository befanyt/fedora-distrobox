FROM quay.io/fedora/fedora-toolbox:43@sha256:aad9f980c380a4d400f66642b9d63e1925626f9c78ad67d3354b835fafa5d121

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
