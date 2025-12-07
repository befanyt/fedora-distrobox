FROM quay.io/fedora/fedora-toolbox:43@sha256:ebab0adf145ba4013fa1fa88d2a07cd0c149cce5d336d9096d2d7644e6ce5a0a

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
