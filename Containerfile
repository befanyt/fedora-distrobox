FROM quay.io/fedora/fedora-toolbox:43@sha256:1cdc63f42411dd46e8da81725274d8de15d253d8fe72fc8952b013939c20a0ba

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
