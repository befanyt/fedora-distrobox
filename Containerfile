FROM quay.io/fedora/fedora-toolbox:43@sha256:04e365cd6ca506d3669e97de0f64a6ae7a4b037a7d41ac08c9322044e8db5f40

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
