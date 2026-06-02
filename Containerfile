FROM quay.io/fedora/fedora-toolbox:43@sha256:0be1d7323c5ddcd6acc667f58a52b50b934ea88a2107de08e1ce2e60982ffcbe

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
