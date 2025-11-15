FROM quay.io/fedora/fedora-toolbox:43@sha256:820f31d8c0d37f4f9ea0c6b5b045b4a95fd56248172c88e26566192505ea833f

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
