FROM quay.io/fedora/fedora-toolbox:43@sha256:06c9a93965c14d87dcb75ab5e03df0232b5ed71ccc9e98b818bdf665d3d095ab

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
