FROM quay.io/fedora/fedora-toolbox:43@sha256:c73dc9fc19653dc2ea11bb4d50f1205011d21c9b957c88153519604df761020e

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
