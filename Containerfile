FROM quay.io/fedora/fedora-toolbox:43@sha256:2f02f0361cbd63806d16114b1cee444929678d3b8612a4da9dfd939e57694156

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
