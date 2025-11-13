FROM quay.io/fedora/fedora-toolbox:43@sha256:11722891e02a60267bab6e3c600e8d94c315922bbf85a71b05791744115475dd

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
