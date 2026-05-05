FROM quay.io/fedora/fedora-toolbox:43@sha256:cc4c556acca19f2c2dc33ac3849b98527f59d11c69230364af8f497d46c2842e

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
