FROM quay.io/fedora/fedora-toolbox:45@sha256:9163bc2c83cbbe6dbb012e04cf05b85f316fec4ecf7681a74c4bd8c05d620487

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
