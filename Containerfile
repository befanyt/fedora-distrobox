FROM quay.io/fedora/fedora-toolbox:43@sha256:e965463b8d13c0786e3772239c0f1d119eab8ffc4f849220eaf74255b746e00c

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
