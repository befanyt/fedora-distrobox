FROM quay.io/fedora/fedora-toolbox:43@sha256:84fdc050800c8f5679780b8e2c58db8805e7b18ff0ef44e168ac85b2e13b4acf

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
