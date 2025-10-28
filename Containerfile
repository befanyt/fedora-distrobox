FROM quay.io/fedora/fedora-toolbox:43@sha256:14416ef9111979e33148621dd957360ce5fb6a5ca7ffe5baf72922fb2518b844

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
