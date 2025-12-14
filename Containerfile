FROM quay.io/fedora/fedora-toolbox:43@sha256:07345a2464871cbe5d5274a0b8363f915afe327c5f4b82d74bffda81955c5d28

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
