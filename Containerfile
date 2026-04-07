FROM quay.io/fedora/fedora-toolbox:43@sha256:836122811ac3e4a33c125a87606bfe13e1a3d01dac344edc7133e2ea0229bd18

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
