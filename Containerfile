FROM quay.io/fedora/fedora-toolbox:43@sha256:d6def5aea0a4d2c39a765bbba30e4c3b3c67e6e2bc9456300143ce93a7696c97

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
