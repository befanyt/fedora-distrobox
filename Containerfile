FROM quay.io/fedora/fedora-toolbox:43@sha256:f0f68234e3dbaed0f0af669948b6c2f487c5f776e1d0b0a70d3db6a271fd4ae5

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
