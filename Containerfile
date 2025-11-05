FROM quay.io/fedora/fedora-toolbox:43@sha256:9c45e0b76e50550caeb00bbb492b19b2e2d690a0e5aa8e52de071b84b44c3bd2

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
