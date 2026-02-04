FROM quay.io/fedora/fedora-toolbox:43@sha256:3b0b2b6520fed3c8299bfbde6df363d4a9a02e95db3732901ecaaf52d1c9162b

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
