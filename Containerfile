FROM quay.io/fedora/fedora-toolbox:43@sha256:da2e75e6fef769bfb2c17d5a3d37d7de0c9c466e0f2568aa683f4374487d5255

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
