FROM quay.io/fedora/fedora-toolbox:43@sha256:ad4c28d292eba4a679fa75dae18611495e4e5f9dec1ae8b5e1cc50eca1aee41d

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
