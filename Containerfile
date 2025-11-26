FROM quay.io/fedora/fedora-toolbox:43@sha256:96388dcf2b5b458b33b0c1163fb725ba99f2c9e44bd717db0daeaa0cb4286d0e

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
