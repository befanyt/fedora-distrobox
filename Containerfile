FROM quay.io/fedora/fedora-toolbox:43@sha256:75e8aaaf125b78fa5d3ce55f48366c21cfb91b1aafbc6fa09e1c9c4cefe62837

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
