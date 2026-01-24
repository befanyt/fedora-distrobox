FROM quay.io/fedora/fedora-toolbox:43@sha256:ee4be00e5a0c204f89013ae3fb15015cc573ef1b0271e25d13058821d36561f0

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
