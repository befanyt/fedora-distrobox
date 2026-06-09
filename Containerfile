FROM quay.io/fedora/fedora-toolbox:43@sha256:0ee7168cf2f5e578bb913d64edc19b9b2729844a332268f968e8675c664a0785

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
