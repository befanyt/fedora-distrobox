FROM quay.io/fedora/fedora-toolbox:43@sha256:2fdb13b8b20177438383cd1014f95e60a6dacea4ef9dd72b650c5dfe425ca292

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
