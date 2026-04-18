FROM quay.io/fedora/fedora-toolbox:43@sha256:ffe032cf60581992bd7343f2b184d3eb994f2a23af3e4aa32c59900d398f8955

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
