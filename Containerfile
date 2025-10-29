FROM quay.io/fedora/fedora-toolbox:43@sha256:b50795b4ba0df060bb6b2f3d7e0999244784537d812ddbe85b7509dea0f31b64

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
