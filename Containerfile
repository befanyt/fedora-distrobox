FROM quay.io/fedora/fedora-toolbox:43@sha256:ab3299ef80a9574381528ac6fd757d82a58dcf8aedabb5fe8f796f79021eaec9

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
