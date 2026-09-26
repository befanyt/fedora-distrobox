FROM quay.io/fedora/fedora-toolbox:43@sha256:75733a6989f61931cdf0d83964b382c4de0cd1364f3d077ab17a5943ab9cb111

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
