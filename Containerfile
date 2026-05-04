FROM quay.io/fedora/fedora-toolbox:43@sha256:6f3f0f3ad77c6842f6ee59b1f89d78327bb392f88793b6437390d007c9c8c3f3

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
