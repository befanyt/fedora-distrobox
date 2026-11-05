FROM quay.io/fedora/fedora-toolbox:43@sha256:1bb154af648b2272b745a8230dd86fcbdcbb09f804a4fa2687ce19df2d35944a

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
