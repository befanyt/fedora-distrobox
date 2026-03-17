FROM quay.io/fedora/fedora-toolbox:43@sha256:97067873c2f50e5d6537a9a88d39c8f6b413ce4fb49c707f3b75d9a726cc2cc8

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
