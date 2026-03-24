FROM quay.io/fedora/fedora-toolbox:43@sha256:984efb0d98f923f5afe0cd6e6eb1f1b043e187e93bbe7082a46ab3d5e293b616

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
