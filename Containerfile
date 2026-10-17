FROM quay.io/fedora/fedora-toolbox:46@sha256:ed14dc9d9de12832b50ece819d515838adf41e3dde0a47e9ddbc284ac63e3316

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
