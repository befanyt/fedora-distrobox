FROM quay.io/fedora/fedora-toolbox:43@sha256:a6e50e936089345c9c6d548203459674d98af137387e6f4c63f79fadb428d1bf

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
