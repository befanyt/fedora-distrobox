FROM quay.io/fedora/fedora-toolbox:43@sha256:85b834374ec81be7d17c628acd727bbd1a84b2c9c388c0c7aff4e51f25c200ec

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
