FROM quay.io/fedora/fedora-toolbox:43@sha256:45cb01ad68f8827339ac5d2ca3623c5973d367f9459c0d97f108a0bab45c6482

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
