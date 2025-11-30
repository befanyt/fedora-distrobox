FROM quay.io/fedora/fedora-toolbox:43@sha256:c0b095f7c723841f07375f6d865135352af03abbbbdb3c5f47e51d2caab7d5c9

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
