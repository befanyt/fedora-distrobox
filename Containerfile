FROM quay.io/fedora/fedora-toolbox:43@sha256:67a00129cf61aa57e411a30a6f0b03d2287396cbe4826df835813e3f5bbd097e

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
