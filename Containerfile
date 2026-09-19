FROM quay.io/fedora/fedora-toolbox:46@sha256:3a1b8e6014f5a99bfde2d48eb7b1b7e7a4c12501ce6e5ae23d00e45dbb138807

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
