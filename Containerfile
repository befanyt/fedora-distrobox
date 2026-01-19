FROM quay.io/fedora/fedora-toolbox:43@sha256:82b86297666e88a58ae321b8d8023cb1b0a94cc867a313fdd806905d1a8faa7f

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
